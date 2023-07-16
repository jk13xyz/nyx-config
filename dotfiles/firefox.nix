{ config, ... }:

{  
  programs.firefox = {
    enable = true;
    profiles.${config.home.username} = {
      settings = {
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
      };
    };
  };
}