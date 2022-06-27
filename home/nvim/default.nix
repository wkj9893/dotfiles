{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    clang-tools
  ];
}
