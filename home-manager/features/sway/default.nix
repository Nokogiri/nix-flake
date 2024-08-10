{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./config.nix
    #./swaync.nix
    ./swaylock.nix
    ./swayosd.nix
    ./user-services.nix
    ./waybar
    #./wlogout.nix
    ./utils
    ../desktop/wayland.nix
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
    QT_STYLE_OVERRIDE = lib.mkForce "Kvantum-Dark";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
  };
  home.packages = with pkgs; [ gdk-pixbuf ];
  programs = {
    #fish.loginShellInit = ''

    #   if test (tty) = "/dev/tty1"
    #     exec systemd-cat --identifier=sway sway &> /dev/null
    #   end
    # '';
    zsh.profileExtra = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec systemd-cat --identifier=sway sway &> /dev/null
      fi
    '';
  };

  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };
}
