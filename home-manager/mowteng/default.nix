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
    #../features/hyprland
    inputs.nur.modules.homeManager.default
  ];
  nixpkgs.overlays = [inputs.nur.overlays.default];
  home.packages = with pkgs; [
    inputs.ghostty.packages.x86_64-linux.default
    handlr-regex
    gimp
    krita
    mullvad-vpn
    nextcloud-client
  ];
}
