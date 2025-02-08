{
  services.esphome = {
    enable = true;
    address = "192.168.178.57";
  };
  services.home-assistant = {
    enable = true;
    config = {
      default_config = {};
      homeassistant = {
        country = "DE";
        longitude = 11.03283;
        latitude = 50.9787;
        unit_system = "metric";
        time_zone = "Europe/Berlin";
        external_url = "https://haos.fishoeder.net";
      };
      "automation ui" = "!include automations.yaml";
      "scene ui" = "!include scenes.yaml";
      "script ui" = "!include scripts.yaml";
      frontend.themes = "!include_dir_merge_named themes";
      lovelace.mode = "storage";
      http = {
        server_host = ["192.168.178.57" "127.0.0.1"];
        trusted_proxies = ["192.168.178.57" "127.0.0.1"];
        use_x_forwarded_for = true;
      };
      recorder.db_url = "postgresql://@/hass";
    };
    extraComponents = [
      "emulated_hue"
      "hue"
      "bluetooth"
      "bluetooth_adapters"
      "bluetooth_le_tracker"
      "bluetooth_tracker"
      "ista_ecotrend"
      "default_config"
      "glances"
      "apple_tv"
      "ios"
      "hardware"
      "met"
      "esphome"
      "twinkly"
      "isal"
      "yeelight"
      "statistics"
      "fritz"
      "fritzbox"
      "androidtv"
      "androidtv_remote"
      "cast"
      "dlna_dmr"
      "scene"
      "dlna_dms"
      "steam_online"
      "spotify"
      "sun"
      "ipp"
      "upnp"
      "mobile_app"
      "jellyfin"
      "homekit"
      "homekit_controller"
      "zha"
      "systemmonitor"
      "history"
      "history_stats"
    ];
    extraPackages = ps: with ps; [psycopg2 aiogithubapi];
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
