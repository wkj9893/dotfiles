{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go_1_18
    gopls
  ];
  home.sessionVariables.GOPATH = "$HOME/.local/go";
}
