{ config, ... }:
{
    home.file."./.sops.yaml".source = ./.sops.yaml;
    home.file."./secrets.yaml".source = ./secrets/secrets.yaml;
}
