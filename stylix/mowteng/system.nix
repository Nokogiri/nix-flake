{ pkgs, inputs, ... }:
{

  #imports = [ inputs.stylix.nixosModules.stylix ];
  imports = [ ../defaults.nix ];

  environment.systemPackages = with pkgs; [
    everforest-theme
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];
  fonts.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    weather-icons
    hack-font
    overpass
    (nerdfonts.override {
      fonts = [
        "MPlus"
        "NerdFontsSymbolsOnly"
        "Overpass"
      ];
    })
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
    };
  };

  stylix = {
    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };
    fonts = {
      serif = {
        name = "Ubuntu";
        package = pkgs.ubuntu_font_family;
      };
      sansSerif = {
        name = "Ubuntu";
        package = pkgs.ubuntu_font_family;
      };
      monospace = {
        name = "M+CodeLat60 Nerd Font Mono";
        package = (
          pkgs.nerdfonts.override {
            fonts = [
              "MPlus"
              "NerdFontsSymbolsOnly"
            ];
          }
        );
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
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
