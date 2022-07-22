{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    deno
    nodejs-18_x
  ];
}
