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
    services.nginx = {
      virtualHosts."books.fishoeder.net" = {
        useACMEHost = "fishoeder.net";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://10.200.200.1:8083";
          extraConfig =
            "proxy_redirect off;"
            + "proxy_set_header Range $http_range;"
            + "proxy_set_header If-Range $http_if_range;"
            + "proxy_set_header X-Real-IP $remote_addr;"
            + "proxy_set_header Host $host;"
            + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
            + "proxy_set_header X-Forwarded-Protocol $scheme;"
            + "proxy_http_version 1.1;"
            + "proxy_set_header Upgrade $http_upgrade;"
            + ''proxy_set_header Connection "upgrade";'';
        };
      };
    };
  };
}
