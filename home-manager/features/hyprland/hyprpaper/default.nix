{ pkgs, ... }:
let
  image = pkgs.fetchurl {
    #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
    #hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
    url = "https://lemmy.ca/pictrs/image/b82e2b77-3910-4d7c-8df8-d2c486db1669.jpeg";
    hash = "sha256-zLrWrMi3NSGLc686u8cDiJpJKIukBwA6pWygAT0NZmQ=";
  };
in
{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ "${image}" ];
      wallpaper = [
        ",${image}"
      ];
    };
  };
  #xdg.configFile."hypr/hyprpaper.conf".text = ''
  #  preload = ${image}
  #  splash = false
  #  wallpaper = eDP-1,${image}
  #'';

  #systemd.user.services = {
  #  hyprpaper = {
  #    Unit = {
  #      Description = "Hyprpaper";
  #    };
  #    Service = {
  #      Type = "simple";
  #      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper";
  #      Restart = "on-failure";
  #    };
  #  };
  #};
}
