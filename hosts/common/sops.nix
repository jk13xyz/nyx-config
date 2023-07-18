{inputs, config, ...}:
{
    imports = [
        inputs.sops-nix.nixosModules.sops
    ];

    sops = {
        defaultSopsFile = ../../secrets/secrets.yaml;
        gnupg = {
            sshKeyPaths = [];
        };
    };
}