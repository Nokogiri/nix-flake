{config, ...}: {
  services.nginx = {
    enable = true;
    virtualHosts."mealie.fishoeder.net" = {
      serverAliases = ["mealie"];
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/".extraConfig = ''
        set $upstream_app 10.200.200.1;
        set $upstream_port 9000;
        set $upstream_proto http;
        proxy_pass $upstream_proto://$upstream_app:$upstream_port;
      '';
    };
  };
}
