{
    home.file."${config.xdg.configHome}/.sops.yaml".text = ''
        keys:
        - &user_jens_gpg C577B6C556EF76FA78E1B271E2AFF28AB89D48EC
        creation_rules:
        - path_regex: secrets/[^/]+\.yaml$
            key_groups:
            - pgp:
                - *user_jens_gpg
                age:
    '';
}