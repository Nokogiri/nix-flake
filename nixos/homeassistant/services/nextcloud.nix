{ pkgs, config, ... }:{
  sops.secrets.nextadmin = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name; # config.services.mealie.user;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  sops.secrets.minio = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  sops.secrets.minio_nc = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  services.nextcloud = {
    enable = true;
    hostName = "next.fishoeder.net";
    https = true;
    package = pkgs.nextcloud29;
    database.createLocally = true;
    configureRedis = true;
    maxUploadSize = "10G";
    phpOptions = {
    	"opcache.interned_strings_buffer" = "23";
    	"log_type" = "file";
    };
    settings = {
    	log_type = "file";
      enabledPreviewProviders = [
        "OC\\Preview\\BMP"
        "OC\\Preview\\GIF"
        "OC\\Preview\\JPEG"
        "OC\\Preview\\Krita"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\MP3"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\PNG"
        "OC\\Preview\\TXT"
        "OC\\Preview\\XBitmap"
        "OC\\Preview\\HEIC"
    ];

    };
    config = {
      adminuser = "nokogiri";
      adminpassFile = config.sops.secrets.nextadmin.path;
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      objectstore.s3 = {
        enable = true;
        bucket = "nextcloud";
        autocreate = true;
        key = "nextcloud";
        secretFile = config.sops.secrets.minio_nc.path;
        hostname = "localhost";
        useSsl = false;
        port = 9000;
        usePathStyle = true;
        region = "us-east-1";
      };
    };
  };
  services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
    forceSSL = true;
    useACMEHost = "fishoeder.net";
  };

  virtualisation.oci-containers.containers = {
    collabora = {
      image = "collabora/code";
      autoStart = true;
      ports = [ "9980:9980" ];
      environment = {
        domain = "cloud.my-nextcloud.domain";
        extra_params = "--o:ssl.enable=false --o:ssl.termination=true";
      };
      extraOptions = ["--cap-add" "MKNOD"];
    };
  };

   services.nginx.virtualHosts."paper.fishoeder.net" = {
    forceSSL = true;
    enableACME = true;
    locations = {
      # static files
      "^~ /loleaflet" = {
        proxyPass = "http://localhost:9980";
        extraConfig = ''
          proxy_set_header Host $host;
        '';
      };
      # WOPI discovery URL
      "^~ /hosting/discovery" = {
        proxyPass = "http://localhost:9980";
        extraConfig = ''
          proxy_set_header Host $host;
        '';
      };

      # Capabilities
      "^~ /hosting/capabilities" = {
        proxyPass = "http://localhost:9980";
        extraConfig = ''
          proxy_set_header Host $host;
        '';
      };

      # download, presentation, image upload and websocket
      "~ ^/lool" = {
        proxyPass = "http://localhost:9980";
        extraConfig = ''
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "Upgrade";
          proxy_set_header Host $host;
          proxy_read_timeout 36000s;
        '';
      };

      # Admin Console websocket
      "^~ /lool/adminws" = {
        proxyPass = "http://localhost:9980";
        extraConfig = ''
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "Upgrade";
          proxy_set_header Host $host;
          proxy_read_timeout 36000s;
        '';
      };
    };
  };

  services.minio = {
    enable = true;
    listenAddress = "127.0.0.1:9000";
    consoleAddress = "127.0.0.1:9001";
    rootCredentialsFile = config.sops.secrets.minio.path;
    dataDir = [ "/media/Vault1.1/MinIO" ];
  };
}
