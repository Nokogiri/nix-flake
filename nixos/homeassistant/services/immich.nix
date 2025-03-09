{ config, ... }:{
  services.immich = {
    enable = true;
    accelerationDevices = null;
    mediaLocation = "/media/Vault0.1/Immich";
    port = 2283;
    settings.server.externalDomain = "https://paper.fishoeder.net";
  };

  services.nginx.virtualHosts."paper.fishoeder.net" = {
    serverAliases = ["immich"];
    useACMEHost = "fishoeder.net";
    forceSSL = true;
    locations."/" = {
      proxyPass = "http://[::1]:${toString config.services.immich.port}";
      proxyWebsockets = true;
      recommendedProxySettings = true;
      extraConfig = ''
        client_max_body_size 50000M;
        proxy_read_timeout   600s;
        proxy_send_timeout   600s;
        send_timeout         600s;
      '';
    };
  };
  services.immich-public-proxy = {
    enable = true;
    immichUrl = "https://immich.fishoeder.net";
  };
  users.users.immich.extraGroups = [ "video" "render" ];
}
