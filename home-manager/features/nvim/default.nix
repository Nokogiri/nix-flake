{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    #neovide
    lua-language-server
    nixd
  ];

  #xdg.configFile = {
  #  nvim = {
  #    onChange = "${pkgs.neovim}/bin/nvim --headless +q";
  #    source = inputs.astronvim;
  #  };
  #};

  programs.neovim = {
    defaultEditor = true;
    enable = true;
    plugins = with pkgs.vimPlugins; [
      mason-nvim
      #nvchad
      #nvim-treesitter
      #nvchad-ui
      lazy-nvim
      LazyVim
    ];
  };
}
