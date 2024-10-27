# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{
  pkgs ? (import ../nixpkgs.nix) { },
}:
{
  amdctl = pkgs.callPackage ./amdctl { };
  dracula-icon-theme = pkgs.callPackage ./dracula-icon-theme { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  lime3ds = pkgs.callPackage ./lime3ds { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  rofimoji = pkgs.callPackage ./rofimoji { };
  #rofi-emoji = pkgs.callPackage ./rofi-emoji { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
}
