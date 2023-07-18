{ config, ... }:
{
    home.file."./secrets.yaml".source = ./secrets.yaml;
}