{ pkgs, ... }:

{
  home.packages = with pkgs; [
    deno
    nodejs-18_x
  ];
}
