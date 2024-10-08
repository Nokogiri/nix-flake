{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    sort = "+time";
    layer = "overlay";
    borderRadius = 10;
    maxVisible = 3;
    anchor = "top-right";
    font = "Overpass 13";
    backgroundColor = "#282a36D8";
    textColor = "#f8f8f2";
    width = 400;
    height = 200;
    margin = "20";
    padding = "5";
    borderSize = 1;
    borderColor = "#282a36D8";
    progressColor = "over #bd93f9D8";
    icons = true;
    maxIconSize = 48;

    markup = true;
    actions = true;
    format = "<b>%s</b>\\n%b";
    defaultTimeout = 0;
    ignoreTimeout = null;
    iconPath = "${pkgs.dracula-icon-theme}/share/icons/Dracula/";
    extraConfig = ''
      [urgency=low]
      border-color=#282a36D8
      
      [urgency=normal]
      border-color=#8be9fdD8

      [urgency=high]
      border-color=#ff5555D8
    '';
  };
}
