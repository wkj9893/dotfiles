{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    sf-pro
    sf-mono
    noto-fonts-cjk-sans
  ];
  home.file.".config/fontconfig/fonts.conf".source = ./fonts.conf;
}
