{ pkgs, ... }:
{
  imports = [ ../defaults.nix ];

  environment.systemPackages = with pkgs; [
    #everforest-theme
    dracula-theme
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
    weather-icons
    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
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
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 24;
    };
    fonts = {
      serif = {
        name = "JetBrainsMono Nerd Font Propo";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "JetBrainsMono Nerd Font Propo";
        package = pkgs.jetbrains-mono;
      };
      monospace = {
        name = "JetBrainsMono Nerd Font Propo";
        package = pkgs.jetbrains-mono;
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
