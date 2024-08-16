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
    backgroundColor = "#2d353bD8";
    textColor = "#d3c6aa";
    width = 400;
    height = 200;
    margin = "20";
    padding = "5";
    borderSize = 1;
    borderColor = "#a7c080";
    progressColor = "over #3d484d";
    icons = true;
    maxIconSize = 48;

    markup = true;
    actions = true;
    format = "<b>%s</b>\\n%b";
    defaultTimeout = 0;
    ignoreTimeout = null;
    iconPath = "${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Dark";
    extraConfig = ''
      [urgency=low]
      background-color=#56635fD8
      border-color=#a7c080
      text-color=#d3c6aa

      [urgency=high]
      background-color=#543a48D8
      border-color=#a7c080
      text-color=#d3c6aa
    '';
  };
}
