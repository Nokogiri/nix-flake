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
    #image = "${pkgs.everforest-theme}/share/wallpaper/Everforest/ocean_front_1.png";
    image = pkgs.fetchurl {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
      hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
    };
    base16Scheme = ./everforest/everforest-dark-medium.yaml;
    polarity = "dark";
  };
}
