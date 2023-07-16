{
  programs.gpg = {
    enable = true;
    publicKeys = [
        {
            source = ./secrets/jk13xyz.asc; trust = ultimate;
        }
    ];
    settings = {
        default-key = "C577 B6C5 56EF 76FA 78E1  B271 E2AF F28A B89D 48EC";
        default-recepient-self = true;
        auto-key-locate = "local,wkd,keyserver";
        keyserver = "hkps://keys.openpgp.org";
        auto-key-retrieve = true;
        auto-key-import = true;
        keyserver-option = "honor-keyserver-url";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
  };
}