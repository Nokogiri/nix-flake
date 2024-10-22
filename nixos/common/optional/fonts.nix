{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides =
    pkgs: with pkgs; {
      nerdfonts = nerdfonts.override {
        fonts = [
          "IntelOneMono"
          "NerdFontsSymbolsOnly"
        ];
      };
    };

  fonts.packages = with pkgs; [
    dejavu_fonts
    hack-font
    intel-one-mono
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    overpass
    weather-icons
  ];

  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        serif = [ "IntoneMono Nerd Font Propo" ];
        sansSerif = [ "IntoneMono Nerd Font Propo" ];
        monospace = [ "IntoneMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
