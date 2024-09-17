{
  inputs,
  outputs,
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
    ../../stylix/mowteng/home.nix
    #../features/sway
    ../features/hyprland
    inputs.nur.nixosModules.nur
  ];

  nixpkgs = {
    overlays = [
      inputs.hyprpanel.overlay
    ];
  };
  home.packages = with pkgs; [
    handlr-regex
    xournalpp
    gimp
    krita
    hyprpanel
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };
}
