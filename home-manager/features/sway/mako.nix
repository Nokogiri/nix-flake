{
  services.mako = {
    enable = true;
    sort = "+time";
    layer = "overlay";
    borderRadius = 5;
    maxVisible = 10;
    anchor = "top-right";
    font = "M+2 Nerd Font 13";
    backgroundColor = "#2d353bD8";
    textColor = "#d3c6aa";
    width = 300;
    height = 100;
    margin = "10";
    padding = "5";
    borderSize = 1;
    borderColor = "#a7c080";
    progressColor = "over #3d484d";
    icons = true;
    maxIconSize = 64;

    markup = true;
    actions = true;
    format = "<b>%s</b>\\n%b";
    defaultTimeout = 12000;
    ignoreTimeout = false;

    extraConfig = ''

      [urgency=low]
      background-color=#2d353bD8
      border-color=#a7c080
      text-color=#dbbc7f

      [urgency=high]
      background-color=#2d353bD8
      border-color=#a7c080
      text-color=#7fbbb3
    '';
  };
}
