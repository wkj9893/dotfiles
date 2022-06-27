{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ gruvbox ];
    extraConfig = ''
      syntax on
      filetype plugin indent on

      set background=dark
      colorscheme gruvbox

      set shiftwidth=2
      set tabstop=2
      set expandtab

      set mouse=a
      set number
      set noswapfile
    '';
  };
  home.sessionVariables.EDITOR = "vim";
}
