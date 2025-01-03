{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    windowManagerPatch = false;
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "frappe";
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
      fullAppDisplayMod
    ];
  };
}
