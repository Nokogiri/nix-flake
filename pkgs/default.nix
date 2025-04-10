# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{pkgs, ...}: {
  amdctl = pkgs.callPackage ./amdctl {};
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots {};
  portmod = pkgs.callPackage ./portmod {};
  rofimoji = pkgs.callPackage ./rofimoji {};
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd {};
}
