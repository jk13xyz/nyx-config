{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = ''
    options snd slots=snd-hda-intel
  '';

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cdb46fe7-2c2d-46b7-b9eb-2280a52803f8";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-66310acb-3460-460c-8f83-8e1a6487c3a1".device = "/dev/disk/by-uuid/66310acb-3460-460c-8f83-8e1a6487c3a1";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/86EA-A506";
      fsType = "vfat";
    };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth = {
    enable = true;
    settings = {
      general = {
        enable = "Source,Sink,Media,Socket";
      };
    };
  };
  
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
