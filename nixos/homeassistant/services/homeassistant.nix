{
  #virtualisation.oci-containers.containers = {
  #  homeassistant = {
  #    image = "ghcr.io/home-assistant/home-assistant:stable";
  #    autoStart = true;
  #    volumes = [
  #      "/var/lib/pods/homeassistant/config:/config"
  #      "/etc/localtime:/etc/localtime:ro"
  #    ];
  #    environment = {
  #      TZ = "Europe/Berlin";
  #      PUID = "1000";
  #      PGID = "1000";
  #    };
  #    extraOptions = ["--network=host"];
  #  };
  #};
  services.home-assistant = {
    enable = true;
    #openFirewall = true;
    #config = null;
    extraComponents = [
      "default_config"
      "met"
      "esphome"
      "twinkly"
      "yeelight"
      "fritz"
      "fritzbox"
      "androidtv"
      "androidtv_remote"
      "cast"
      "dlna_dmr"
      "dlna_dms"
      "spotify"
      "sun"
      "ipp"
      "upnp"
      "mobile_app"
      "jellyfin"
      "homekit"
      "homekit_controller"
    ];
    config.http.server_host = ["192.168.178.47" "127.0.0.1"];
  };
  services.nginx = {
    virtualHosts."haos.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://192.168.178.57:8123";
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
}
