{ config, pkgs, ... }:
{

  imports = [
    ./firefox
    ./gammastep.nix
    ./gpg-agent.nix
    #./kitty.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./rbw.nix
    ./rofi
    ./udisks.nix
    ./wezterm
    ./wofi
    ./wvkbd.nix
    ./xdg
    ./ydotool.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    cliphist
    libnotify
    swayimg
    wl-clipboard
    xdg_utils
    xfce.thunar
  ];

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };

  systemd.user.sessionVariables = {
    PATH = "/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
    QT_QPA_PLATFORM = "${config.home.sessionVariables.QT_QPA_PLATFORM}";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
}
