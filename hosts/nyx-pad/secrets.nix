{config, inputs, sops-nix, ...}:

{
  imports = [
    inputs.sops-nix-homeManagerModule
  ];

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
  };
}
