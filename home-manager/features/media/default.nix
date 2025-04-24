{pkgs, ...}: {
  imports = [
    ./mpv
    ./pipewire.nix
    ./spotify.nix
    ./yt-dlp.nix
  ];
  home.packages = with pkgs; [
    calibre
    gimp3-with-plugins
    koreader
    krita
    playerctl
  ];
  services = {
    playerctld.enable = true;
  };
  xdg.desktopEntries."umpv" = {
    exec = "";
    name = "umpv";
    settings.NoDisplay = "true";
  };
}
