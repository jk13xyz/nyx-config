{ config, ...  }:
{
    sops.secrets."wireless.env" = { }; 
    networking.wireless = {
        environmentFile = config.sops.secrets."wireless.env".path; 
        networks = { "@home_uuid@" = { psk = "@home_psk@"; }; };
    };
}
