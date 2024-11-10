# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{
  pkgs ? (import ../nixpkgs.nix) { },
}:
{
  #_7zz = pkgs.callPackage ./7zz { };
  amdctl = pkgs.callPackage ./amdctl { };
  #asmc = pkgs.callPackage ./asmc { };
  #cemu = pkgs.callPackage ./cemu { };
  dracula-icon-theme = pkgs.callPackage ./dracula-icon-theme { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  rofimoji = pkgs.callPackage ./rofimoji { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
}
