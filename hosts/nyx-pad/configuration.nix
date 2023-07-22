{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./pkgs.nix
      ./services.nix
      ./sops.nix
      ../common/fonts.nix      
      ../common/locale.nix
      ../common/wireless.nix
      ../../dotfiles/hyprland/default.nix
      ../../dotfiles/hyprland/hyprpaper/default.nix   
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot = {
    loader = {
      systemd-boot = {
        enable = lib.mkForce false;
        configurationLimit = 5;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      initrd = {
        "/crypto_keyfile.bin" = null;
      };
      lanzaboote = {
        enable = true;
        pkiBundle = "/etc/secureboot";
      };
    };
  };

  networking.hostName = "nyx-pad";
  networking.networkmanager.enable = true;

  users.users.jens = {
    isNormalUser = true;
    description = "Jens Krieger";
    extraGroups = [ "jens" "audio" "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  system.stateVersion = "23.05";
}
