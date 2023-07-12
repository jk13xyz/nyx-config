{ config, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "JK13xyz";
    userEmail = "jens@jk13.dev";
    signing = {
      key = "E2AFF28AB89D48EC";
      gpgPath = "${config.programs.gpg.package}/bin/gpg2";
      signByDefault = true;
    };
  };
}