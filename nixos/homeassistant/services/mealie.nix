{
  config,
  inputs,
  ...
}: {
  sops.secrets.mealieCredentials = {
    sopsFile = ../../common/secrets.yaml;
    owner = config.users.users.nobody.name; # config.services.mealie.user;
    group = config.users.users.nobody.group;
    mode = "0666";
  };
  services.mealie = {
    enable = true;
    listenAddress = "127.0.0.1";
    credentialsFile = config.sops.secrets.mealieCredentials.path;
    settings = {
      ALLOW_SIGNUP = "false";
      BASE_URL = "https://mealie.fishoeder.net";
      DB_ENGINE = "sqlite";
      THEME_DARK_PRIMARY = "#A92B53";
      #THEME= "dark";
    };
  };
}
