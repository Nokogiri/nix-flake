{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofimoji ];
  programs.rofi = {
    package = pkgs.rofi-wayland;
    plugins = [ pkgs.rofi-emoji-wayland ];
    enable = true;
    extraConfig = {
      display-drun = "";
      modi = "drun,ssh,window,emoji";
      kb-primary-paste = "Control+V,Shift+Insert";
      kb-secondary-paste = "Control+v,Insert";
      show-icons = true;
    };
    theme = ./dracula.rasi;
  };

  xdg.configFile."rofimoji.rc".text = ''
    files all
  '';
}
