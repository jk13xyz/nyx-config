{pkgs, ...}:
{
  services = {  
    getty= {
      autologinUser = "jens";
    };

    pcscd = {
      enable = true;
    };

  rtkit.enable = true;

  pipewire = {
      enable = true;
      asla.enable = true;
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