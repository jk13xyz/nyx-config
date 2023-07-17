{config, pkgs, ...}:
{  
    programs.hyprland= {
        enable = true;
    };

    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}