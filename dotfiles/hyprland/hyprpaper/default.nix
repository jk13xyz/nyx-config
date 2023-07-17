{pkgs, ...}:
{
    home = {
        packages = with pkgs; [
        pkgs.hyprpaper
        ];
    };

    home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
    home.file.".config/hypr/wallpaper.jpg".source = ./wallpaper.jpg;
}