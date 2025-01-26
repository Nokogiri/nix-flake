{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/media
    ../features/nvim
    #../features/plasma
    ../features/hyprland
    inputs.nur.modules.homeManager.default
  ];

  home.packages = with pkgs; [
    handlr-regex
    distrobox
    gamehub
    gimp
    krita
    mullvad-vpn
    nextcloud-client
  ];
}
