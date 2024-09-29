{
  services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
  networking.firewall.allowedTCPPorts = [
    5357 # wsdd
  ];
  networking.firewall.allowedUDPPorts = [
    3702 # wsdd
  ];

  services.samba = {
    enable = true;
    #securityType = "user";
    settings = {
      global = {
        workgroup = "WORKGROUP";
        "multicast dns register" = "yes";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        security = "user";
        "hosts allow" = "192.168.178. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nokogiri";
        "map to guest" = "bad user";
      };
      Vault31 = {
        path = "/media/Vault3.1";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "nokogiri";
        "force group" = "users";
      };
    };
  };
}
