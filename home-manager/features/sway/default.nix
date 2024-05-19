{ pkgs, config, ... }:
{
  imports = [
    ./config.nix
    ./swaylock.nix
    ./swaync.nix
    ./swayosd.nix
    ./user-services.nix
    ./waybar
    #./wlogout.nix
  ];
  
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "${config.gtk.cursorTheme.name}";
  };
  home.packages = with pkgs; [ squeekboard ];
  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec systemd-cat --identifier=sway sway &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec sway &> /dev/null
      fi
    '';
  };

  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };
}
