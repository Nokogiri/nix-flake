{
  virtualisation.oci-containers.containers = {
    calibre-web = {
      image = "ghcr.io/linuxserver/calibre-web";
      autoStart = true;
      volumes = [
        "/var/lib/pods/calibre-web/calibre-data:/config"
        "/var/lib/pods/calibre-web/books:/books"
      ];
      environment = {
        TZ = "Europe/Berlin";
        DOCKER_MODS = "linuxserver/mods:universal-calibre";
        PUID = "1000";
        PGID = "1000";
      };
      ports = ["10.200.200.1:8083:8083/tcp"];
    };
  };
  services.nginx = {
    virtualHosts."cali.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://10.200.200.1:8083";
        proxyWebsockets = true;
        extraConfig =
          "proxy_set_header Range $http_range;"
          + "proxy_set_header If-Range $http_if_range;"
          + "proxy_set_header X-Real-IP $remote_addr;"
          + "proxy_set_header Host $host;"
          + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
          + "proxy_set_header X-Forwarded-Protocol $scheme;"
          + "proxy_set_header Upgrade $http_upgrade;"
          + " proxy_hide_header 'x-frame-options';"
          + "proxy_set_header X-Forwarded-Ssl on;"
          + "proxy_set_header X-Script-Name /calibre;"
          + ''add_header x-frame-options "allowall";''
          + ''proxy_set_header Connection "upgrade";'';
      };
    };
  };
}
