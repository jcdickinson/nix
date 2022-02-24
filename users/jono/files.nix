{ pkgs, ... }:

{
    ".config/electron-flags.conf".source = ./files/electron-flags.conf;
    ".config/electron13-flags.conf".source = ./files/electron-flags.conf;
    ".local/share/applications/codium.desktop".source = ./files/codium.desktop;
}
