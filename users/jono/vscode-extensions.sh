#! /usr/bin/env nix-shell
#! nix-shell -i bash -p curl jq unzip
# shellcheck shell=bash
set -eu -o pipefail

# Helper to just fail with a message and non-zero exit code.
function fail() {
    echo "$1" >&2
    exit 1
}

# Helper to clean up after ourselves if we're killed by SIGINT.
function clean_up() {
    TDIR="${TMPDIR:-/tmp}"
    echo "Script killed, cleaning up tmpdirs: $TDIR/vscode_exts_*" >&2
    rm -Rf "$TDIR/vscode_exts_*"
}

function ext_in_nixpkgs() {
    nix eval --impure --expr "(import <nixpkgs> {}).vscode-extensions.$1.name" 2>/dev/null >/dev/null
}

function get_vsixpkg() {
    N="$1.$2"

    if ext_in_nixpkgs "$N"; then
        echo "$N exists in nixpkgs"
        echo "  $N" >> $NIXPKGS_EXTENSIONS
        return
    fi

    # Create a tempdir for the extension download.
    EXTTMP=$(mktemp -d -t vscode_exts_XXXXXXXX)

    URL="https://$1.gallery.vsassets.io/_apis/public/gallery/publisher/$1/extension/$2/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"

    echo "Discovering $N..." >&2

    # Quietly but delicately curl down the file, blowing up at the first sign of trouble.
    curl --silent --show-error --retry 3 --fail -X GET -o "$EXTTMP/$N.zip" "$URL"
    # Unpack the file we need to stdout then pull out the version
    VER=$(jq -r '.version' <(unzip -qc "$EXTTMP/$N.zip" "extension/package.json"))
    # Calculate the SHA
    SHA=$(nix-hash --flat --base32 --type sha256 "$EXTTMP/$N.zip")

    echo "Discovered $N ($VER - $SHA)" >&2

    # Clean up.
    rm -Rf "$EXTTMP"
    # I don't like 'rm -Rf' lurking in my scripts but this seems appropriate.

    echo "
  {
    name = \"$2\";
    publisher = \"$1\";
    version = \"$VER\";
    sha256 = \"$SHA\";
  }" >> $MARKET_EXTENSIONS
}

function generate-config() {
    CODE=$(command -v code || command -v codium)

    if [ -z "$CODE" ]; then
        # Not much point continuing.
        fail "VSCode executable not found"
    fi

    # Try to be a good citizen and clean up after ourselves if we're killed.
    trap clean_up SIGINT

    # Begin the printing of the nix expression that will house the list of extensions.
    printf '{ pkgs, ... }:\npkgs.vscode-utils.extensionsFromVscodeMarketplace [' > $MARKET_EXTENSIONS
    printf '{ pkgs, ... }:\nwith pkgs.vscode-extensions; [' > $NIXPKGS_EXTENSIONS

    # Note that we are only looking to update extensions that are already installed.
    for i in $($CODE --list-extensions) "$@"
    do
        OWNER=$(echo "$i" | cut -d. -f1)
        EXT=$(echo "$i" | cut -d. -f2)
        FULL="$OWNER.$EXT"

        get_vsixpkg "$OWNER" "$EXT"
    done

    # Close off the nix expression.
    printf ']' >> $MARKET_EXTENSIONS
    printf ']' >> $NIXPKGS_EXTENSIONS
}

NIXPKGS_EXTENSIONS=./vscode-nixpkgs-extensions.nix
MARKET_EXTENSIONS=./vscode-market-extensions.nix
generate-config "$@"