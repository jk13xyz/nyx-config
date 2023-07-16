{
    programs.ncspot = {
        enable = true;
    };

    home.file.".config/ncspot/config.toml".source = ./config.toml;
}