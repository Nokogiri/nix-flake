{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd '${pkgs.uwsm}/bin/uwsm start default'";
        user = "greeter";
      };
    };
  };
}
