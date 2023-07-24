{pkgs, ...}:
{
  services = {  
    getty= {
      autologinUser = "jens";
    };

    pcscd = {
      enable = true;
    };

  pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    udev = {
      packages = with pkgs; [
        yubikey-personalization
      ];
    };

    thermald = {
      enable = true;
    };

  };
}