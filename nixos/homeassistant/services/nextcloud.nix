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
    caching = {
    	redis = true;
    	apcu = true;
    	memcached = true;
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
        hostname = "127.0.0.1";
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
      ports = [ "127.0.0.1:9980:9980" ];
      environment = {
        domain = "paper.fishoeder.net";
        server_name = "paper.fishoeder.net";
        dictionaries = "en_US";
        aliasgroup1 = "https://next.fishoeder.net:443";
        extra_params = "--o:ssl.enable=false --o:ssl.termination=true";
      };
      extraOptions = ["--cap-add" "MKNOD"];
    };
  };

   services.nginx.virtualHosts."paper.fishoeder.net" = {
    forceSSL = true;
    useACMEHost = "fishoeder.net";
    locations = {
      "^~ /browser" = {
      	proxyPass = "http://127.0.0.1:9980";
      	extraConfig = ''
      	proxy_set_header Host $host;
      	'';
      };
      # static files
      "^~ /loleaflet" = {
        proxyPass = "http://127.0.0.1:9980";
        extraConfig = ''
          proxy_set_header Host $host;
        '';
      };
      # WOPI discovery URL
      "^~ /hosting/discovery" = {
        proxyPass = "http://127.0.0.1:9980";
        extraConfig = ''
          proxy_set_header Host $host;
        '';
      };

      # Capabilities
      "^~ /hosting/capabilities" = {
        proxyPass = "http://127.0.0.1:9980";
        extraConfig = ''
          proxy_set_header Host $host;
        '';
      };

	  "~ ^/cool/(.*)/ws$" = {
	       proxyPass = "http://127.0.0.1:9980";
	       extraConfig = ''
	           proxy_set_header Upgrade $http_upgrade;
	           proxy_set_header Connection "Upgrade";
	           proxy_set_header Host $host;
	       	   proxy_read_timeout 36000s;
	       '';
	  };
      # download, presentation, image upload and websocket
      "~ ^/(c|l)ool" = {
        proxyPass = "http://127.0.0.1:9980";
        extraConfig = ''
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "Upgrade";
          proxy_set_header Host $host;
          proxy_read_timeout 36000s;
        '';
      };

      # Admin Console websocket
      "^~ /cool/adminws" = {
        proxyPass = "http://127.0.0.1:9980";
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
    dataDir = [ "/media/Vault3.1/MinIO" ];
  };
}
