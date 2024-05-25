{ config, ... }:
{
  sops.secrets = {
    "wg/mowteng" = { };
    "psk_wg/mowteng" = { };
  };

  networking.wireguard.interfaces = {
    haos = {
      ips = [
        "10.200.200.30/24"
        "fc00::3"
      ];
      listenPort = 51871;
      privateKeyFile = config.sops.secrets."wg/mowteng".path;

      peers = [
        {
          publicKey = "IqYGE/5SPmMPEs0us6ZkH5RlePZ2KJDpGxBgjCBnQno=";
          presharedKeyFile = config.sops.secrets."psk_wg/mowteng".path;
          allowedIPs = [ "10.200.200.0/24" ];
          endpoint = "home.fishoeder.net:51871";
        }
      ];
    };
  };
}
