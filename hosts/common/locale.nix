 { config, ... }:

 {
 
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "de_CH.UTF-8";

  services.xserver = {
    layout = "ch";
    xkbVariant = "de_nodeadkeys";
  };

  console.keyMap = "sg";

 }