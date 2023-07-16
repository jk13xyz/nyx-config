{
  programs.gpg = {
    enable = true;
    publicKeys = [
      { 
        source = ./secrets/jk13xyz.asc; 
      }
    ];
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
  };
}