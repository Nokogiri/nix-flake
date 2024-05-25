{ pkgs, ... }:
let 
  image = pkgs.fetchurl {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
      hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
    };
in
{

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${image}
    splash = false
    wallpaper = eDP-1,${image}
  '';

  systemd.user.services = {
    hyprpaper = {
      Unit = {
        Description = "Hyprpaper";
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
        Restart = "on-failure";
      };
    };
  };
}
