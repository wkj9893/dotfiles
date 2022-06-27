{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go_1_18
    gopls
    delve
    go-tools
    golangci-lint
  ];
  home.sessionVariables.GOPATH = "$HOME/.local/go";
}
