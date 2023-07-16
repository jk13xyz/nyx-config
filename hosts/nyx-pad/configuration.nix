{ config, pkgs, ... }:

{
  imports =
    [ 
      ../common/fonts.nix      
      ../common/locale.nix
      ./hardware-configuration.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "nyx-pad";
  networking.networkmanager.enable = true;
#  networking.wireless.enable = true;

  users.users.jens = {
    isNormalUser = true;
    description = "Jens Krieger";
    extraGroups = [ "jens" "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  services.getty.autologinUser = "jens";

  environment.systemPackages = with pkgs; [
    wget
    pkgs.polkit
    pkgs.mako
    pkgs.rofi
    pkgs.brightnessctl
    pkgs.pipewire
    pkgs.pulseaudio
    pkgs.xdg-desktop-portal-hyprland
    pkgs.zip
    pkgs.unzip
    pkgs.zsh-autocomplete
    pkgs.zsh-syntax-highlighting
    yubikey-personalization
    yubikey-manager
  ];

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  services.pcscd.enable = true;

  programs.zsh.enable = true;

  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
  programs.hyprland.enable = true;
#  programs.home-manager.enable = true;

  services.pipewire = {
     enable = true;
     wireplumber.enable = true;
  };
  
  system.stateVersion = "23.05";

}
