{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd \"systemd-cat --identifier=WindowManager Hyprland &> /dev/null\"";
        user = "greeter";
      };
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd \"systemd-cat --identifier=WindowManager Hyprland &> /dev/null\"";
        user = "nokogiri";
      };

    };
  };
}
