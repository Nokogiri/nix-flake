{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../global
    ../features/cli/nix-stuff.nix
    ../features/desktop
    ../features/games
    ../features/media
    ../features/nvim
    ../features/sway
    inputs.nur.nixosModules.nur
  ];

  home.packages = with pkgs; [
    handlr-regex
    gimp
    krita
    mullvad-vpn
  ];
}
