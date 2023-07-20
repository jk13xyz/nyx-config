{ inputs, config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./services.nix
      ../common/fonts.nix      
      ../common/locale.nix
      ../../dotfiles/hyprland/default.nix
      ../../dotfiles/hyprland/hyprpaper/default.nix
      ../../dotfiles/zsh/default.nix      
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "nyx-pad";
  networking.networkmanager.enable = true;

  users.users.jens = {
    isNormalUser = true;
    description = "Jens Krieger";
    extraGroups = [ "jens" "audio" "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    wget
    pkgs.age
    pkgs.brightnessctl
    pkgs.clipman
    pkgs.flameshot
    pkgs.mako
    pkgs.polkit
    pkgs.rofi
    pkgs.pavucontrol
    pkgs.pipewire
    pkgs.pulseaudio
    pkgs.ssh-to-age
    pkgs.xdg-desktop-portal-hyprland
    pkgs.zip
    pkgs.unzip
    pkgs.zsh-autocomplete
    pkgs.zsh-syntax-highlighting
    yubikey-personalization
    yubikey-manager
  ];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.age.sshKeyPaths = [ "/home/jens/.ssh/id_ed25519" ];
  sops.age.keyFile = "/home/jens/.config/sops/age/keys.txt";
  sops.secrets."user/jens/passwd" = { sopsFile = ../../secrets/secrets.yaml; };

  system.stateVersion = "23.05";
}
