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
    ../features/plasma
    inputs.nur.modules.homeManager.default
  ];

  home.packages = with pkgs; [
    inputs.kwin-gestures.packages.x86_64-linux.default
    handlr-regex
    gimp
    krita
    mullvad-vpn
    nextcloud-client
  ];
}
