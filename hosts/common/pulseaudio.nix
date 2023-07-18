{
  security.rtkit.enable = true;
  hardware.pulseaudio = {
    enable = false;
    extraConfig = ''
      load-module module-switch-on-connect
    ''  
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}