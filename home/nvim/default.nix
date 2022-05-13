{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    stylua
    clang-tools
  ];
  home.sessionVariables.EDITOR = "nvim";
  home.shellAliases.e = "nvim";
}
