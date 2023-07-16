{ config, lib, pkgs, inputs, ... }:

{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
      pkgs.ncspot
    ];
    stateVersion = lib.mkDefault "23.05";
    sessionVariables = {
      XDG_RUNTIME_DIR = "/run/user/$UID";
    };
  };

  programs.home-manager.enable = true;

  imports =
    [ 
      ./dotfiles/git.nix
      ./dotfiles/firefox.nix
      ./dotfiles/neofetch/default.nix
      ./dotfiles/zsh/default.nix
    ];  

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    settings = {

    };
  };

  services.clipman = {
    enable = true;
  };

  services.flameshot = {
    enable = true;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
