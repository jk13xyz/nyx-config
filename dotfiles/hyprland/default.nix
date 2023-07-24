{ config, pkgs, ... }:
{  
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSOR = "1";
        NIXOS_OZONE_WL = "1";
    };

    xdg.portal = {
        enable = true;
    };

}