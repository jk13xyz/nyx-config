{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        wget
        pkgs.age
        pkgs.brightnessctl
        pkgs.clipman
        pkgs.grim
        pkgs.mako
        pkgs.polkit
        pkgs.rofi
        pkgs.pavucontrol
        pkgs.pipewire
        pkgs.pulseaudio
        pkgs.ssh-to-age
        pkgs.slurp
        pkgs.swappy
        pkgs.xdg-desktop-portal-hyprland
        pkgs.zip
        pkgs.zsh-autosuggestions
        pkgs.zsh-syntax-highlighting
        pkgs.zsh-powerlevel10k    
        pkgs.unzip
        yubikey-personalization
        yubikey-manager
    ];
}
