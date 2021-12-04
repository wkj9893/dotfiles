{ pkgs, fetchFromGitHub, ... }:

{
  home.packages = with pkgs; [
    neovim
    stylua
  ];
  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua/options.lua".source = ./lua/options.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./lua/plugins.lua;
  xdg.configFile."nvim/plugin/cmp.lua".source = ./plugin/cmp.lua;
  xdg.configFile."nvim/plugin/default.lua".source = ./plugin/default.lua;
  xdg.configFile."nvim/plugin/lsp.lua".source = ./plugin/lsp.lua;
  xdg.configFile."nvim/plugin/treesitter.lua".source = ./plugin/treesitter.lua;
}
