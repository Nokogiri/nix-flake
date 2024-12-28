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
    inputs.nur.modules.homeManager.default
  ];
  nixpkgs.overlays = [inputs.nur.overlays.default];
  home.packages = with pkgs; [
    handlr-regex
    gimp
    krita
    mullvad-vpn
    nextcloud-client
  ];
}
