{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "Hyprlaunch" ''
      exec systemd-cat --identifier=Hyprland Hyprland &> /dev/null
    '')
  ];
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd Hyprlaunch ";
        #\"systemd-cat --identifier=WindowManager Hyprland &> /dev/null\"";
        user = "greeter";
      };
    };
  };
}
