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
    intel-one-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    weather-icons
    (nerdfonts.override {
      fonts = [
        "GeistMono"
        "IntelOneMono"
        "NerdFontsSymbolsOnly"
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
        name = "Overpass";
        package = pkgs.overpass;
      };
      sansSerif = {
        name = "Overpass";
        package = pkgs.overpass;
      };
      monospace = {
        name = "IntoneMono Nerd Font";
        package = pkgs.overpass;
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
