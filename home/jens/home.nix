{ config, lib, pkgs, ... }:

{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
      pkgs.sops
    ];
    stateVersion = lib.mkDefault "23.05";
    sessionVariables = {
      XDG_RUNTIME_DIR = "/run/user/$UID";
    };
  };

  programs.home-manager.enable = true;

  imports = [ 
      ../../dotfiles/git/default.nix
      ../../dotfiles/gpg/default.nix
      ../../dotfiles/hyprland/hyprland.nix
      ../../dotfiles/firefox/default.nix        
      ../../dotfiles/kitty/default.nix
      ../../dotfiles/ncspot/default.nix
      ../../dotfiles/neofetch/default.nix
      ../../dotfiles/neovim/default.nix
      ../../dotfiles/starship/default.nix
      ../../dotfiles/waybar/config.nix
      ../../dotfiles/zsh/default.nix
#      ../../hosts/nyx-pad/secrets.nix      
    ];

#  sops.defaultSopsFile = "../../secrets/secrets.yaml";
#  sops.age.sshKeyPaths = [ "../../hosts/nyx-pad/secrets/nyx-pad.pub" ];
#  sops.age.keyFile = /home/jens/.config/sops/age/keys.txt;
#  sops.generateKey = true;
#  sops.secrets.user.jens.passwd = "/home/jens/test.txt";
}
