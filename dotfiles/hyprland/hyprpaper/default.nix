{pkgs, ...}:
{
    home = {
        packages = with pkgs; [
        pkgs.hyprpaper
        ];
    };
}