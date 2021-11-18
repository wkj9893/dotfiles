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
  xdg.configFile."nvim/lua/options.lua".source = ./lua/options.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./lua/plugins.lua;
  xdg.configFile."nvim/lua/plugin/treesitter.lua".source = ./plugin/treesitter.lua;
}
