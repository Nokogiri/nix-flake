# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{pkgs, ...}: {
  amdctl = pkgs.callPackage ./amdctl {};
  #heroic-unwrapped = pkgs.callPackage ./heroic {
  #  electron = pkgs.electron_32;
  #};
  #heroic = pkgs.callPackage ./heroic/fhsenv.nix {};
  klassy = pkgs.kdePackages.callPackage ./klassy {};
  krohnkite = pkgs.callPackage ./krohnkite {};
  kwin-effects-geometry-change = pkgs.callPackage ./kwin-effects-geometry-change {};
  #libwg = pkgs.callPackage ./mullvad/libwg.nix {};
  #mullvad = pkgs.callPackage ./mullvad/mullvad.nix {};
  #inherit (pkgs.callPackage ./mullvad { }) mullvad;
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots {};
  panel-system-info = pkgs.callPackage ./panel-system-info {};
  plasma-window-title-applet = pkgs.callPackage ./plasma-window-title-applet {};
  portmod = pkgs.callPackage ./portmod {};
  rofimoji = pkgs.callPackage ./rofimoji {};
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd {};
  #vintagestory = pkgs.callPackage ./vintagestory {};
  vscode-taskexplorer = pkgs.callPackage ./vscode-taskexplorer {};
}
