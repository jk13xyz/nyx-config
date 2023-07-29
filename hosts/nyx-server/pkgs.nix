{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        wget
        pkgs.age
        pkgs.htop
        pkgs.ssh-to-age
        pkgs.zip
        pkgs.zsh-autosuggestions
        pkgs.zsh-syntax-highlighting
        pkgs.zsh-powerlevel10k    
        pkgs.unzip
        yubikey-personalization
        yubikey-manager
    ];
}