{ config, pkgs, ... }:

{
  imports =
    [
      ./common.nix
      ./jono-laptop-hardware-configuration.nix
    ];

  networking.hostName = "jono-laptop";
  networking.wireless.enable = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl = {
    driSupport = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
     offload.enable = true;
     nvidiaBusId = "01:00:0";
     intelBusId = "05:00:0";    
    };
    # powerManagement.enable = true;
  };

  # Enable sound.
  sound.enable = false;

  services.xserver.libinput.enable = true;
  programs.steam.enable = true;

  system.stateVersion = "21.11"; # Did you read the comment?

}

