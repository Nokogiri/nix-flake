{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      cursor = {
        style = "beam";
        blink = "yes";
        beam-thickness = 1.5;
        color = "ff0000 00ff00";
      };
      main = {
        pad = "10x10";
      };
      scrollback = {
        indicator-position = "fixed";
        indicator-format = "percentage";
      };
    };
  };
}
