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
    #../features/sway
    ../features/hyprland
    inputs.nur.modules.homeManager.default
  ];
  nixpkgs.overlays = [inputs.nur.overlay];
  home.packages = with pkgs; [
    handlr-regex
    gimp
    krita
    mullvad-vpn
    nextcloud-client
  ];
}
