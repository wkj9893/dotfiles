{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim-nightly
    gopls
    rnix-lsp
    clang-tools
    rust-analyzer
    nodePackages.pyright
    nodePackages.typescript-language-server
  ];
  xdg.configFile."nvim/init.lua".source = ./init.lua;
}
