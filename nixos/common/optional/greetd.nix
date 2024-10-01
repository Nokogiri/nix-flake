{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd \"${pkgs.fish}/bin/fish --login\"";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd \"systemd-cat --identifier=WindowManager sway &> /dev/null\"";
        user = "greeter";
      };
    };
  };
}
