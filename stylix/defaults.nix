{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  environment.pathsToLink = [
    "/share/Kvantum"
    "/share/themes"
    "/share/icons"
  ];

  stylix = {
    autoEnable = false;
    homeManagerIntegration.followSystem = true;
    image = ./images/japanese.jpeg;
    #pkgs.fetchurl {
    #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/light/Kojiro.png";
    #url = "https://raw.githubusercontent.com/Apeiros-46B/everforest-walls/0ae7c31e34385b9af33a74a707b9c4acbfef4d8c/close_up/flowers.png";
    #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/bulbs.jpg";
    #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/forest-mountain-cloudy-valley.png";
    #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/tTIlCNT.jpeg";
    #url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/forest-2.jpg";
    #hash = "sha256-JRro+wz9NrVOeLwjWwpQYzy9wG7IyhfGa1cUxr9Wpio=";
    #hash = "sha256-S289wtWBOk8cOqrd1YsRrdBgrDDzREHD7ZRLZ38NJ1I=";
    #hash = "sha256-Qm8tpGAfjea3XdvqMoTyPTGPe/mHf5YRLSLbNNGj+C4=";
    #hash = "sha256-fa1K47o1nBCHApVYj12SGnRym7JpnkU1nvLqA7OyslM=";
    #hash = "sha256-3GZFl8QnxAUJlI5B5taGVFKGp6Asn7UGKXxtDi3lhiQ=";
    # hash = "sha256-RqzCCnn4b5kU7EYgaPF19Gr9I5cZrkEdsTu+wGaaMFI=";
    #};
    #base16Scheme = ./everforest/everforest-dark-medium.yaml;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    base16Scheme = ./dracula/dracula.nix;
    polarity = "dark";
    targets = {
      console.enable = true;
      fish.enable = false;
      gtk.enable = true;
      nixos-icons.enable = true;
      #plymouth.enable = true;

      #plymouth.logo = ./images/logo.png;

    };
  };
}
