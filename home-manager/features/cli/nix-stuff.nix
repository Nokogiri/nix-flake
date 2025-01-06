{pkgs, ...}: {
  home.packages = with pkgs; [
    nix-diff
    nix-direnv
    nix-tree
  ];
}
