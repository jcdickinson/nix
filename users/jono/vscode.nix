{ pkgs, ... }@attrs:

{
  enable = true;
  package = pkgs.vscodium;
  extensions =
    (import ./vscode-nixpkgs-extensions.nix attrs) ++
    (import ./vscode-market-extensions.nix attrs);
  userSettings = {
    "editor.fontFamily" = "'MonoLisa', monospace";
    "terminal.integrated.fontFamily" = "'MonoLisa Nerd Font'";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 14;
    "terminal.integrated.profiles.linux" = {
      "fish" = {
        "path" = "fish";
      };
    };
    "terminal.integrated.defaultProfile.linux" = "fish";
    "update.mode" = "manual";
    # "window.titleBarStyle" = "custom";
    "git.enableSmartCommit" = false;
    "git.suggestSmartCommit" = false;
    "git.autofetch" = true;
    "git.autoStash" = true;
    "lldb.showDisassembly" = "never";
  };
}
