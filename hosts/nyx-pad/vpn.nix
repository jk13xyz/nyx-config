{config, ...}:
{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/24" ];
      listenPort = 51820;
      privateKey = config.sops.secrets.protonvpn-privkey.path;

      peers = [

        {
          publicKey = "Hd3hdhX18q6tnET4x77hg/xou3o/tdf7iEgLTqtRwVY=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "185.159.157.14:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
