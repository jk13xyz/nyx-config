{
    sops.defaultSopsFile = ../../secrets/nyx-server.yaml;
    sops.age.sshKeyPaths = [ "/home/jens/.ssh/id_ed25519" ];
    sops.age.keyFile = "/home/jens/.config/sops/age/keys.txt";
}