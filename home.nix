{ config, lib, pkgs, ... }:

{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
      pkgs.libsForQt5.dolphin
    ];
    stateVersion = lib.mkDefault "23.05";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "JK13xyz";
    userEmail = "jens@jk13.dev";
    signing = {
      key = "9D8B36DFE8EABC3C";
      gpgPath = "${config.programs.gpg.package}/bin/gpg2";
      signByDefault = true;
    };
  };

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      CaptivePortal = false;
      DisableFirefoxStudies = true;
      Disable Pocket = true;
      Disable Telemetry = true;
      DisableFirefoxAccounts = false;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        TopSites = true;
        Snippets = false;
        Highlights = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
  };

  programs.neovim = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
