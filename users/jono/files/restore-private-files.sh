#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source $SCRIPT_DIR/unpack-private-files.sh

gpg --import ~/.config/private-files/gpg/gpg.asc
gpg --import-ownertrust < ~/.config/private-files/gpg/trustdb.txt

mkdir -p ~/.ssh
mv ~/.config/private-files/ssh/* ~/.ssh

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
chmod 644 ~/.ssh/*.pub

mkdir -p ~/.local/share/fonts

mv ~/.config/private-files/licensed/monolisa/nerd/otf/* ~/.local/share/fonts
mv ~/.config/private-files/licensed/monolisa/regular/otf/* ~/.local/share/fonts

fc-cache -f -v

rm -r ~/.config/private-files