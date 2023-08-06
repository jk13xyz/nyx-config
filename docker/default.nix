{
    virtualisation.docker = {
        enable = true;
        enableOnBoot = true;
    }; 
       
    users = {
        extraUsers = {
            docker = {
                createHome = true;
                home = "/srv/docker";
                uid = 1001;
            };
        };

        extraGroups = {
            docker = {
                gid = 1001;
                members = [ "docker" ];
            };
        };
    };

    imports = [

    ];
}