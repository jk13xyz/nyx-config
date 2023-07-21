{
    home.file."./.sops.yaml".source = ./.sops.yaml;
    home.file."./${networking.hostname}.yaml".source = ./secrets.yaml;
}
