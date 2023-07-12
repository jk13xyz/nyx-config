{ config, lib, pkgs, inputs, ... }:

{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
      pkgs.neofetch
    ];
    stateVersion = lib.mkDefault "23.05";
  };

  programs.home-manager.enable = true;

  imports =
    [ 
      ./dotfiles/firefox.nix
      ./dotfiles/neofetch.nix
    ];  
  
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "JK13xyz";
    userEmail = "jens@jk13.dev";
    signing = {
      key = "E2AFF28AB89D48EC";
      gpgPath = "${config.programs.gpg.package}/bin/gpg2";
      signByDefault = true;
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
