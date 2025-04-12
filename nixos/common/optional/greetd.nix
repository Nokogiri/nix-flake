{
  pkgs,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --asterisks --cmd '${lib.getBin pkgs.uwsm}/bin/uwsm start default'";
        user = "greeter";
      };
    };
  };
}
