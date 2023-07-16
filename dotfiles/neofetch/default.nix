{ config, ... }:

{
  home = {
    packages = with pkgs; [
      pkgs.neofetch
    ];
  };

  home.file.".config/neofetch/neofetch.conf".source = ./neofetch.conf
}  

let
  configDir = "/home/${config.home.username}/.config";
in

{
 
  home.file = {
      "${configDir}/neofetch/config.conf" = {
          text = ''
            
          '';
      };
  };

}