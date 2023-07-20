{ config, lib, pkgs, ... }:

{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
      pkgs.sops
      pkgs.zsh-autosuggestions
      pkgs.zsh-syntax-highlighting
      pkgs.zsh-powerlevel10k
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
      ../../dotfiles/waybar/config.nix
      ../../dotfiles/zsh/plugins.nix
      ../../secrets/default.nix     
    ];

#  sops.secrets.user.jens.passwd = { };
}
