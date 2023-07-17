{config, pkgs, ...}:
{  
    home = {
        packages = with pkgs; [
        pkgs.hyprland
        ];
    };

    programs.hyprland = {
        enable = true;
    };

    #  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}