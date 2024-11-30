{pkgs, ...}: {
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nix-diff
    nix-direnv
    nix-tree
    nix-pin
  ];
}
