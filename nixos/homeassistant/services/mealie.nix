{
  services.mealie = {
    enable = true;
    listenAddress = "127.0.0.1";
    settings = {
      ALLOW_SIGNUP = "true";
      BASE_URL = "https://mealie.fishoeder.net";
      DB_ENGINE = "sqlite";
    };
  };
}
