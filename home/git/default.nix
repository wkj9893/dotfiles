{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
    lazygit
  ];
  home.file.".config/git/config".source = ./config;
}
