{pkgs, ...}:
{  
    getty= {
      autologinUser = "jens";
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