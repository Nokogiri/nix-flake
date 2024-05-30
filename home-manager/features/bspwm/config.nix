{ pkgs, inputs, ... }:
let
  bsp = "${pkgs.bspwm}/bin/bspc";
in
{
  xsession.windowManager.bspwm = {
    monitors = {
      eDP-1 = [
        "I"
        "II"
        "III"
        "IV"
        "V"
        "VI"
        "VII"
        "VIII"
        "IX"
      ];
    };
    settings = {
      border_width = 2;
      borderless_monocle = true;
      gapless_monocle = true;
      split_ration = 0.52;
      window_gap = 12;
    };
  };

  services.sxhkd = {
    keybindings = {
      "super+Return" = "${
        inputs.wezterm.packages.${pkgs.system}.default
      }/bin/wezterm-gui";
      "super + shift + {q,r}" = "${bsp} {quit,wm -r}";
      "super + {_,shift + }{1-9}" = "${bsp} {desktop -f,node -d} '^{1-9}'";
      "super + p" = "${pkgs.rofi}/bin/rofi -show drun";
    };
  };
}
