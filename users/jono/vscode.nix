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
  }];
  userSettings = {
    "editor.fontFamily" = "'UbuntuMono Nerd Font', monospace";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 18;
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
