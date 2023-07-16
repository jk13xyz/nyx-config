{ config, pkgs, inputs, ... }:

{
  home = {
    packages = with pkgs; [
      pkgs.neofetch
    ];
  };

  home.file.".config/neofetch/config.conf".source = ./config.conf;
}