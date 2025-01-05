{pkgs, ...}: {
  imports = [
    ./colors.nix
    ./firefox
    ./gpg-agent.nix
    ./joplin-d.nix
    ./kitty.nix
    #./obs-studio.nix
    ./rbw.nix
    #./rofi
    ./vscode.nix
    ./xdg
  ];

  home.packages = with pkgs; [
    libnotify
    xdg-utils
    #udiskie
    (writeShellScriptBin "launch-gamescope" ''
      exec env LD_PRELOAD="" nice -n -11 -- gamescope "$@"
    '')
    wl-clipboard
  ];

  home.pointerCursor = {
    package = pkgs.kdePackages.breeze;
    gtk.enable = true;
    name = "breeze_cursors";
    size = 24;
    x11.enable = true;
  };

  home.preferXdgDirectories = true;

  home.sessionVariables = {
    BROWSER = "${pkgs.firefox}/bin/firefox";
    DISABLE_QT5_COMPAT = "0";
    NO_AT_BRIDGE = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    NIXOS_OZONE_WL = "1";
  };

  systemd.user.sessionVariables = {
    PATH = "/var/lib/flatpak/exports/bin:/run/wrappers/bin:/home/nokogiri/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin";
  };
}
