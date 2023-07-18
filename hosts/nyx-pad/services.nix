{pkgs, ...}:
{
  services = {  
    getty= {
      autologinUser = "jens";
    };

    pcscd = {
      enable = true;
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