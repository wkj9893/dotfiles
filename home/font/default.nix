{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    source-han-sans
    sf-pro
    sf-mono
  ];
  home.file.".config/fontconfig/fonts.conf".source = ./fonts.conf;
}
