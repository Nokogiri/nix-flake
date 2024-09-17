{ config, ... }:{
  imports = [ ../../common/optional/systemd-network.nix ];
  sops.secrets."mullvad/sacred_turkey" = {
  	owner = "systemd-network";
  	mode = "0660";
  };
  networking.useDHCP = false;
  systemd.network = {
    netdevs = {
      "mullvad0" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "mullvad0";
          #MTUBytes = "1300";
        };
        # See also man systemd.netdev (also contains info on the permissions of the key files)
        wireguardConfig = {
          # Don't use a file from the Nix store as these are world readable. Must be readable by the systemd.network user
          PrivateKeyFile = config.sops.secrets."mullvad/sacred_turkey".path;
          ListenPort = 9918;
        };
        wireguardPeers = [
          {
            # se-got-wg-002
            PublicKey = "AtvE5KdPeQtOcE2QyXaPt9eQoBV3GBxzimQ2FIuGQ2U=";
            AllowedIPs = [ "0.0.0.0/0" "::0/0" ];
            Endpoint = "185.213.154.67:51820";
          }
        ];
      };
    };
    networks = {
      "wired" = {
        matchConfig.Name = [ "en*" ];
        DHCP = "yes";
        dhcpV4Config = {
          UseDomains = true;
        };
        networkConfig = {
          IPv6AcceptRA = "no";
          MulticastDNS = true;
        };
      };
      "mullvad0" = {
        # See also man systemd.network
        matchConfig.Name = "mullvad0";
        # IP addresses the client interface will have
        address = [
          "fc00:bbbb:bbbb:bb01::9:6e9/128"
          "10.72.6.234/32"
        ];
        DHCP = "no";
        dns = ["10.64.0.1"];
        gateway = [
          "fc00::1"
          "10.64.0.1"
        ];
      };
    };
  };
}
