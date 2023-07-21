{
    sops.defaultSopsFile = ../../secrets/nyx-pad.yaml;
    sops.age.sshKeyPaths = [ "/home/jens/.ssh/id_ed25519" ];
    sops.age.keyFile = "/home/jens/.config/sops/age/keys.txt";
    sops.secrets."user/jens/passwd" = { sopsFile = ../../secrets/nyx-pad.yaml; };
}