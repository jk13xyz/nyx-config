 { config, pkgs, fonts, ... }:

 {

  fonts.fonts = with pkgs; [
    font-awesome
    noto-fonts
    (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" ]; })
  ];

 } 