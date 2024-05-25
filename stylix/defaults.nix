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
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
      hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
    };
    #base16Scheme = ./everforest/everforest-dark-medium.yaml;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    polarity = "dark";
  };
}
