{ config, ... }:
{
  sops.secrets.mealie_mail = {
    sopsFile = ../../../common/secrets.yaml;
    owner = config.users.users.nokogiri.name;
    group = config.users.users.nobody.group;
    mode = "0666";

  };
  virtualisation.oci-containers.containers = {
    mealie = {
      image = "ghcr.io/mealie-recipes/mealie"; #:v1.10.2";
      autoStart = true;
      volumes = [ "/var/lib/pods/mealie/data:/app/data" ];
      environmentFiles = [
        #	config.sops.secrets.mealieCredentials.path
        config.sops.secrets.mealie_mail.path
      ];
      environment = {
        TZ = "Europe/Berlin";
        PUID = "1000";
        PGID = "1000";
        ALLOW_SIGNUP = "false";
        #DB_ENGINE = "sqlite";
        THEME_DARK_PRIMARY = "#A92B53";
        THEME_LIGHT_PRIMARY = "#A92B53";
        BASE_URL = "https://mealie.fishoeder.net";
        MAX_WORKERS = "3";
        WEB_CONCURRENCY = "1";
        SMTP_USER = "nokogiri@gefjon.org";
        SMTP_HOST = "smtp.gmail.com";
        SMTP_PORT = "587";
        SMTP_AUTH_STRATEGY = "TLS";
        SMTP_FROM_NAME = "Mealie";
        SMTP_FROM_EMAIL = "mealie@fishoeder.net";
      };
      ports = [ "10.200.200.1:9000:9000/tcp" ];
    };
  };
}
