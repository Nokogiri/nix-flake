{ pkgs, ... }:
{
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
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    material-symbols
    rubik
    weather-icons
    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
        "Hack"
        "JetBrainsMono"
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
    enable = true;
    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };
    fonts = {
      serif = {
        name = "JetBrainsMono Nerd Font Propo";
        package = pkgs.hack-font;
      };
      sansSerif = {
        name = "JetBrainsMono Nerd Font Propo";
        package = pkgs.hack-font;
      };
      monospace = {
        name = "JetBrainsMono Nerd Font Propo";
        package = pkgs.hack-font;
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
  };
}
