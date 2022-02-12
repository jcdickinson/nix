{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot = {
    plymouth.enable = true;
    loader = {
        timeout = 1;
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
        grub = {
          devices = [ "nodev" ];
          version = 2;
          efiSupport = true;
          enable = true;
        };
    };
  };

  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = true;
  };

  networking.networkmanager.enable = true;
  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.printing.enable = true;

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    config.pipewire = {
      default.clock.rate = 48000;
    };
  };

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  users.mutableUsers = false;

  environment.systemPackages = with pkgs; [
    gtk4
    firefox
    git
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "21.11";
}
