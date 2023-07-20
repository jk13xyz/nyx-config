{ config, pkgs, ... }:
{  
    programs.hyprland = {
        enable = true;
        xwayland = true;
    };

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSOR = "1";
        NIXOS_OZONE_WL = "1";
    };
}