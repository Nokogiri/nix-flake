{config, ...}: {
  sops.secrets.mealie_mail = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name; # config.services.mealie.user;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  services.mealie = {
    enable = true;
    listenAddress = "127.0.0.1";
    port = 9099;
    credentialsFile = config.sops.secrets.mealie_mail.path;
    settings = {
      ALLOW_SIGNUP = "false";
      BASE_URL = "https://mealie.fishoeder.net";
      DB_ENGINE = "sqlite";
      THEME_DARK_PRIMARY = "#A92B53";
      THEME_DARK_ACCENT = "#007A99";
      THEME_DARK_SECONDARY = "#973542";
      THEME_DARK_SUCCESS = "#43A047";
      THEME_DARK_INFO = "#1976D2";
      THEME_DARK_WARNING = "#FF6D00";
      THEME_DARK_ERROR = "#EF5350";
      THEME_LIGHT_PRIMARY = "#A92B53";
      THEME_LIGHT_ACCENT = "#007A99";
      THEME_LIGHT_SECONDARY = "#973542";
      THEME_LIGHT_SUCCESS = "#43A047";
      THEME_LIGHT_INFO = "#1976D2";
      THEME_LIGHT_WARNING = "#FF6D00";
      THEME_LIGHT_ERROR = "#EF5350";
      MAX_WORKERS = "3";
      WEB_CONCURRENCY = "1";
      SMTP_USER = "nokogiri@gefjon.org";
      SMTP_HOST = "smtp.gmail.com";
      SMTP_PORT = "587";
      SMTP_AUTH_STRATEGY = "TLS";
      SMTP_FROM_NAME = "Mealie";
      SMTP_FROM_EMAIL = "mealie@fishoeder.net";
    };
  };
}
