{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang_14
    clang-tools
  ];
}
