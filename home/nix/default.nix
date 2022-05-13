{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rnix-lsp
    nixpkgs-fmt
  ];
  home.sessionVariables.GOPATH = "$HOME/.local/go";
}
