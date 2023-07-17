{pkgs, ...}:
{  
  services = {
    clipman = {
      enable = true;
    };

    flameshot = {
      enable = true;
    };

    getty= {
      autologinUser = "jens";
    };

    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };

    pcscd = {
      enable = true;
    };

    pipewire = {
      enable = true;
      wireplumber.enable = true; 
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