{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd \"systemd-cat --identifier=sway sway &> /dev/null\"";
        user = "greeter";
      };
    };
  };
}
