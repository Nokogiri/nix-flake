{ config, ... }:
{
  imports = [ ../common/optional/systemd-network.nix ];
  #boot.extraModulePackages = [config.boot.kernelPackages.wireguard];
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Settings = {
        AutoConnect = true;
      };
    };
  };
  networking.useDHCP = false;
  systemd.network.networks = {
    "wifi" = {
      matchConfig.Name = [ "wl*" ];
      DHCP = "yes";
      dhcpV4Config = {
        UseDomains = true;
      };
      networkConfig = {
        IPv6AcceptRA = "no";
        MulticastDNS = true;
      };
    };
    haos = {
      matchConfig.Name = "haos";
      address = [ "10.200.200.30/32" ];
      DHCP = "no";
      dns = [ "10.200.200.1" ];
      #gateway = [ "10.200.200.1" ];
    };
  };

  sops.secrets = {
    "wg/haos" = {
      owner = "systemd-network";
    };
    "psk_wg/haos" = {
      owner = "systemd-network";
    };
  };
  systemd.network = {
    netdevs = {
      "haos" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "haos";
          MTUBytes = "1300";
        };
        wireguardConfig = {
          PrivateKeyFile = config.sops.secrets."wg/haos".path;
          ListenPort = 51871;
        };
        wireguardPeers = [
          {
            wireguardPeerConfig = {
              PublicKey = "FgmfBFZw9gQ7NjJJq4hoZty7BYltQHdOcZDPxHiycAs=";
              PresharedKeyFile = config.sops.secrets."psk_wg/haos".path;
              AllowedIPs = [ "10.200.200.1" ];
              Endpoint = "home.fishoeder.net:51871";
            };
          }
        ];
      };
    };
  };
}
