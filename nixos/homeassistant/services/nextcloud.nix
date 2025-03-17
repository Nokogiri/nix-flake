{
  pkgs,
  config,
  ...
}: {
  sops.secrets.nextadmin = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name;
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
    package = pkgs.nextcloud31;
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

  services.minio = {
    enable = true;
    browser = true;
    listenAddress = ":9000";
    consoleAddress = ":9001";
    rootCredentialsFile = config.sops.secrets.minio.path;
    dataDir = ["/media/Vault0.1/MinIO"];
  };
}
