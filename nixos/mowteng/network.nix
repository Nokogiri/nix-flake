{lib, ...}: {
  networking.networkmanager = {
    wifi.backend = "iwd";
    wifi.powersave = true;
    enable = false;
    #dns = "systemd-resolved";
    logLevel = "ERR";
    plugins = lib.mkForce [];
  };
  networking.useDHCP = false;
  networking.useNetworkd = true;
  networking.wireless.iwd = {
    enable = true;
    settings = {
      Network = {
        EnableIPv6 = true;
        RoutePriorityOffset = 300;
      };
      Settings = {
        AutoConnect = true;
      };
    };
  };
  systemd.network = {
    networks = {
      "wireless" = {
        matchConfig.Name = ["wl*"];
        DHCP = "yes";
        dhcpV4Config = {
          UseDomains = true;
          UseDNS = true;
          UseRoutes = true;
        };
        networkConfig = {
          IPv6AcceptRA = "no";
          MulticastDNS = true;
        };
      };
    };
  };
  services.resolved = {
    enable = true;
    llmnr = "true";
    #domains = [ "home.arpa" ];
    fallbackDns = ["9.9.9.9"];
  };
}
