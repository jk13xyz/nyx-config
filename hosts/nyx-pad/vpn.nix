{config, ...}:
{
  networking.wg-quick.interfaces.wg0 = {
    autostart = true;
    dns = [ "10.2.0.1" ];
    privateKeyFile = config.sops.secrets.protonvpn-privkey.path;
    address = [ "10.2.0.2/32" ];
    listenPort = 51820;

    peers = [
        {
            publicKey = "Hd3hdhX18q6tnET4x77hg/xou3o/tdf7iEgLTqtRwVY=";
            allowedIPs = [ "0.0.0.0/0" ];
            endpoint = "185.159.157.14:51820";
        }
    ];
  };
}
