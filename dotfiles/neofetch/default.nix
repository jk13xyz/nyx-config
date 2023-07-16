{ config, ... }:

{
  home = {
    packages = with pkgs; [
      pkgs.neofetch
    ];
  };

  home.file.".config/neofetch/neofetch.conf".source = ./neofetch.conf;
}