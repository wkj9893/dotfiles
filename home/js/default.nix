{ pkgs, ... }:

{
  home.packages = with pkgs; [
    deno
    nodejs-18_x
    nodePackages.pnpm
  ];
  home.sessionVariables.GOPATH = "$HOME/.local/go";
}
