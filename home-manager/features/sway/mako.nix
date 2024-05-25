{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    sort = "+time";
    layer = "overlay";
    borderRadius = 5;
    maxVisible = 10;
    anchor = "top-right";
    font = "M+2 Nerd Font 13";
    backgroundColor = "#282828D8";
    textColor = "#D4BE98";
    width = 300;
    height = 100;
    margin = "10";
    padding = "5";
    borderSize = 1;
    borderColor = "#A9B665";
    progressColor = "over #3C3836";
    #icons = 1;
    maxIconSize = 64;

    #markup = 1;
    #actions = 1;
    format = "<b>%s</b>\\n%b";
    defaultTimeout = 12000;
    ignoreTimeout = null;
    iconPath = "${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Dark";
    extraConfig = ''


      #icons = 1
      #markup = 1
      #actions = 1
      [urgency=low]
      background-color=#2d353bD8
      border-color=#A9B665
      text-color=#dbbc7f

      [urgency=high]
      background-color=#2d353bD8
      border-color=#A9B665
      text-color=#7fbbb3
    '';
  };
}
