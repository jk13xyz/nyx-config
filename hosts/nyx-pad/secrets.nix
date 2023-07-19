{ config, ...}:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
  };
}
