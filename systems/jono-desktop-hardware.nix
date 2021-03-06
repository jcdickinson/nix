# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "amdgpu" ];
  boot.initrd.kernelModules = [ "" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/257eb7e6-474b-4f80-9368-0c854121aec8";
      fsType = "ext4";
      options = [ "discard" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7F55-3391";
      fsType = "vfat";
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/32a7f31b-513b-429c-9530-6f42a14f25f5";
      fsType = "ext4";
      options = [ "discard" "noatime" "nodev" "noexec" "nosuid" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/db712661-53d2-4978-876d-2756fdba6180";
      fsType = "ext4";
      options = [ "discard" "noatime" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/aae3254e-ecc0-46e6-99f7-3429c050710d";
      fsType = "ext4";
      options = [ "discard" "noatime" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/f7080a77-c45c-415c-ad3a-b17ec9d84640";
      fsType = "ext4";
      options = [ "discard" "noatime" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/6d101e82-572e-43b1-9758-31b8eafe9190"; }
    ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
