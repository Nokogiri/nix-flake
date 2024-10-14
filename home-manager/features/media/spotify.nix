{
  pkgs,
  inputs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      genericName = "SpotifyWM";
      exec = "spotify";
      icon = "spotify";
      terminal = false;
    };
  };
  programs.spicetify = {
    windowManagerPatch = false;
    enable = true;
    theme = spicePkgs.themes.dracula;
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      betterLibrary
    ];
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      popupLyrics
      fullScreen
      powerBar
      hidePodcasts
      volumePercentage
      #fullAppDisplayMod
    ];
  };
}
