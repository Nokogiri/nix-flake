{
  imports = [ ../../common/optional/systemd-network.nix ];
  networking.useDHCP = false;
  systemd.network.networks."wired" = {
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
}
