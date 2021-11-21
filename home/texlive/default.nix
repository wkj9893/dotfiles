{ pkgs, ... }:
# https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/tools/typesetting/tex/texlive/pkgs.nix
{
  home.packages = with pkgs; [
    (texlive.combine
      {
        inherit (texlive)
          scheme-basic
          collection-langchinese
          collection-bibtexextra
          xetex
          luatex
          everysel
          latexmk;
      }
    )
  ];
}
