 { config, pkgs, fonts, ... }:

 {

  fonts.fonts = with pkgs; [
    font-awesome
    noto-fonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

 } 