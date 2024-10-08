{ pkgs, ... }:
{
  #xidg.configFile."bat/themes/Dracula.tmTheme".source =
  #  ./Dracula.tmTheme;
  xdg.configFile."bat/themes/Dracula.tmTheme".source = (
    pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/dracula/sublime/refs/heads/master/Dracula.tmTheme";
      hash = "sha256-Z2f+fPWidZ0QggcVb1AMGJo97CFr1vT2C5tLwJ+/ilo=";
    }
  );
  programs.bat = {
    enable = true;
    config.theme = "Dracula";
    extraPackages = with pkgs.bat-extras; [
      #batdiff
      batman
      batgrep
      batwatch
    ];
  };
}
