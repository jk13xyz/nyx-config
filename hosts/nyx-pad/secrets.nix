{ config, inputs, sops-nix, home, ...}:

{
  imports = [
    inputs.sops-nix-homeManagerModule
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
  };
}
