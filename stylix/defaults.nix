{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  environment.pathsToLink = [
    "/share/Kvantum"
    "/share/themes"
    "/share/icons"
  ];

  stylix = {
    homeManagerIntegration.followSystem = true;
    image = pkgs.fetchurl {
      #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
      url = "https://raw.githubusercontent.com/Apeiros-46B/everforest-walls/0ae7c31e34385b9af33a74a707b9c4acbfef4d8c/close_up/flowers.png";
      hash = "sha256-S289wtWBOk8cOqrd1YsRrdBgrDDzREHD7ZRLZ38NJ1I=";
      #hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
    };
    base16Scheme = ./everforest/everforest-dark-medium.yaml;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    polarity = "dark";
  };
}
