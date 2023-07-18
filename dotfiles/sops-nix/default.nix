{ config, ... }:
{
    home.file."../.sops.yaml".source = ./.sops.yaml;
}