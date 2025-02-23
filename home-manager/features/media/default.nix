{pkgs, ...}: {
  imports = [
    ./mpv
    ./pipewire.nix
    ./spotify.nix
    ./yt-dlp.nix
  ];
  home.packages = with pkgs; [
    calibre
    #freetube
    gimp
    #jellyfin-media-player
    koreader
    krita
    playerctl
    tidal-hifi
  ];
  services = {
    playerctld.enable = true;
  };
  xdg.desktopEntries."umpv" = {
    exec = "";
    name = "umpv";
    settings.NoDisplay = "true";
  };
  #xdg.desktopEntries."com.github.iwalton3.jellyfin-media-player" = {
  #  exec = "env env QT_WAYLAND_DISABLE_WINDOWDECORATION=0 ${pkgs.jellyfin-media-player}/bin/jellyfinmediaplayer";
  #  name = "Jellyfin Media Player";
  #  icon = "com.github.iwalton3.jellyfin-media-player";
  #  terminal = false;
  #  categories = [
  #    "AudioVideo"
  #    "Video"
  #    "Player"
  #    "TV"
  #  ];
  #  comment = "Desktop client for Jellyfin";
  #};
}
