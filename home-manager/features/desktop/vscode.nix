{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      bodil.file-browser
      asvetliakov.vscode-neovim
    ];
  };
}
