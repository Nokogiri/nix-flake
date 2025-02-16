{
  inputs,
  #pkgs,
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
    #inputs.nur.modules.homeManager.default
  ];

  #home.packages = with pkgs; [

  #];
}
