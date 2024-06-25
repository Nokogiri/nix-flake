{ pkgs, ... }:
let
  image1 = pkgs.fetchurl {
    url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
    hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
  };
  image2 = pkgs.fetchurl {
    url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/forest-2.jpg";
    hash = "sha256-RqzCCnn4b5kU7EYgaPF19Gr9I5cZrkEdsTu+wGaaMFI=";
  };
  image3 = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Apeiros-46B/everforest-walls/0ae7c31e34385b9af33a74a707b9c4acbfef4d8c/close_up/flowers.png";
    hash = "sha256-S289wtWBOk8cOqrd1YsRrdBgrDDzREHD7ZRLZ38NJ1I=";
  };
in
{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [
        "${image1}"
        "${image2}"
        "${image3}"
      ];
      wallpaper = [ "eDP-1,${image3}" ];
    };
  };
}
