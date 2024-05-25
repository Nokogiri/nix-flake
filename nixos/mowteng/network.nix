{
  imports = [ ../common/optional/systemd-network.nix ];
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Settings  = {
        AutoConnect = true;
      };
    };
  };
  networking.useDHCP = false;
  systemd.network.networks."wifi" = {
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
}
