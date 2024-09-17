{ config, ... }:{
  imports = [ ../../common/optional/systemd-network.nix ];
  networking.useDHCP = false;
  systemd.network = {
    netdevs = {
      "mullvad0" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "mullvad0";
          MTUBytes = "1300";
        };
        # See also man systemd.netdev (also contains info on the permissions of the key files)
        wireguardConfig = {
          # Don't use a file from the Nix store as these are world readable. Must be readable by the systemd.network user
          PrivateKeyFile = "/run/keys/wireguard-privkey";
          ListenPort = 9918;
        };
        wireguardPeers = [
          {
            PublicKey = "OhApdFoOYnKesRVpnYRqwk3pdM247j8PPVH5K7aIKX0=";
            AllowedIPs = ["fc00::1/64" "10.100.0.1"];
            Endpoint = "{set this to the server ip}:51820";
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
    };
  };
}
