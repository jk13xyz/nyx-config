{ config, lib, pkgs, inputs, ... }:

{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
    ];
    stateVersion = lib.mkDefault "23.05";
    sessionVariables = {
      XDG_RUNTIME_DIR = "/run/user/$UID";
    };
  };

  programs.home-manager.enable = true;

  imports =
    [ 
      ../../dotfiles/git/default.nix
      ../../dotfiles/gpg/default.nix
      ../../dotfiles/hyprland/hyprland.nix
      ../../dotfiles/firefox/default.nix        
      ../../dotfiles/kitty/default.nix
      ../../dotfiles/ncspot/default.nix
      ../../dotfiles/neofetch/default.nix
      ../../dotfiles/neovim/default.nix
      ../../dotfiles/sops-nix/default.nix
      ../../dotfiles/starship/default.nix
      ../../dotfiles/waybar/default.nix
      ../../dotfiles/zsh/default.nix
    ];
}
