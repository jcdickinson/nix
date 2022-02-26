{ pkgs, ... }:

{
    ".config/compress-private-files.sh" = {
        source = ./files/compress-private-files.sh;
        executable = true;
    };
    ".config/restore-private-files.sh" = {
        source = ./files/restore-private-files.sh;
        executable = true;
    };
    ".config/unpack-private-files.sh" = {
        source = ./files/unpack-private-files.sh;
        executable = true;
    };
    ".config/private-files.tar.gz.gpg".source = ./files/private-files.tar.gz.gpg;
    ".config/electron-flags.conf".source = ./files/electron-flags.conf;
    ".config/electron13-flags.conf".source = ./files/electron-flags.conf;
    ".local/share/applications/codium.desktop".source = ./files/codium.desktop;
}
