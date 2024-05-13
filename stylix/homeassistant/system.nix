{ pkgs, inputs, ... }:
{

  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    homeManagerIntegration.followSystem = true;
    image = "${pkgs.everforest-theme}/share/wallpaper/Everforest/ocean_front_1.png";
    base16Scheme = ../everforest/everforest-dark-medium.yaml;
    polarity = "dark";
    opacity = {
      desktop = 0.85;
      popups = 0.85;
      terminal = 0.9;
    };
    targets = {
      plymouth.logoAnimated = false;
    };
  };
}
