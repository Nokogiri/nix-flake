# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{pkgs, ...}: {
  amdctl = pkgs.callPackage ./amdctl {};
  dracula-icon-theme = pkgs.callPackage ./dracula-icon-theme {};
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth {};
  klassy = pkgs.kdePackages.callPackage ./klassy {};
  krohnkite = pkgs.callPackage ./krohnkite {};
  kwin-effects-geometry-change = pkgs.callPackage ./kwin-effects-geometry-change {};
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots {};
  panel-system-info = pkgs.callPackage ./panel-system-info {};
  plasma-window-title-applet = pkgs.callPackage ./plasma-window-title-applet {};
  rofimoji = pkgs.callPackage ./rofimoji {};
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd {};
}
