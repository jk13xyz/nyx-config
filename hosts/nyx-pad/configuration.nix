{ config, pkgs, ... }:

{
  imports =
    [ 
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

  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "de_CH.UTF-8";

  services.xserver = {
    layout = "ch";
    xkbVariant = "de_nodeadkeys";
  };

  console.keyMap = "sg";

  users.users.jens = {
    isNormalUser = true;
    description = "Jens Krieger";
    extraGroups = [ "jens" "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.getty.autologinUser = "jens";

  environment.systemPackages = with pkgs; [
    wget
    pkgs.polkit
    pkgs.mako
    pkgs.rofi
    pkgs.brightnessctl
  ];

  fonts.fonts = with pkgs; [
    font-awesome
    noto-fonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
  programs.hyprland.enable = true;
  programs.waybar.enable = true;
#  programs.home-manager.enable = true;

  services.pipewire = {
     enable = true;
     wireplumber.enable = true;
  };
  
  system.stateVersion = "23.05";

}
