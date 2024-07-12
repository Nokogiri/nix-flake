{ config, pkgs, ... }:
{

  imports = [
    ./firefox
    ./gpg-agent.nix
    ./kitty.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./rbw.nix
    ./rofi
    ./udisks.nix
    ./wofi
    ./xdg
    ./ydotool.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    libnotify
    xdg_utils
    xfce.thunar
    zed-editor
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  systemd.user.sessionVariables = {
    PATH = "/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
    QT_QPA_PLATFORMTHEME = "${config.home.sessionVariables.QT_QPA_PLATFORMTHEME}";
  };
}
