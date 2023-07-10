{ config, lib, pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  home = {
    username = lib.mkDefault "jens";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    packages = with pkgs; [
      pkgs.neofetch
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
      key = "1305BFA92EF9D14E";
      gpgPath = "${config.programs.gpg.package}/bin/gpg2";
      signByDefault = true;
    };
  };

  programs.firefox = {
    enable = true;
    extensions = with addons; [
      ublock-origin
    ];
    profiles.${config.home.username} = {
      "browser.disableResetPrompt" = true;
      "dom.security.https_only.mode" = true;
      "identity.fxaccounts.enabled" = true;
      "signon.rememberSignons" = false;
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
