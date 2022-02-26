{ pkgs, ... }:

{
  enable = true;
  package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    vadimcn.vscode-lldb
    matklad.rust-analyzer
  ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
    name = "even-better-toml";
    publisher = "tamasfe";
    version = "0.14.2";
    sha256 = "944dadf8a51f0a50ffc63a6f7b14c9944afb2ae7e8fb6d8350cf49bb84e2b29d";
  } {
    name = "dhall-lang";
    publisher = "dhall";
    version = "0.0.4";
    sha256 = "eef610dd3a368488ac9a8f48416456c0ab2ee255d9521d0eafcf560cb3264069";
  } {
    name = "vscode-dhall-lsp-server";
    publisher = "dhall";
    version = "0.0.4";
    sha256 = "5a8a56ccc0ad8a22ebc77a473620cc65815d8d2df9f6fbb74feeae23903e36fe";
  }];
  userSettings = {
    "editor.fontFamily" = "'MonoLisa Nerd Font', monospace";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 15;
    "terminal.integrated.profiles.linux" = {
      "fish" = {
        "path" = "fish";
      };
    };
    "terminal.integrated.defaultProfile.linux" = "fish";
    "update.mode" = "manual";
    "window.titleBarStyle" = "custom";
  };
}
