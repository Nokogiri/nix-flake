# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{
  pkgs ? (import ../nixpkgs.nix) { },
}:
{
  amdctl = pkgs.callPackage ./amdctl { };
  dracula-plymouth = pkgs.callPackage ./dracula-plymouth { };
  everforest-theme = pkgs.callPackage ./everforest-theme { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  rofi-emoji = pkgs.callPackage ./rofi-emoji { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
}
