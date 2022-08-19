{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    sf-pro
    iosevka-bin
    noto-fonts-cjk-sans
  ];
  home.file.".config/fontconfig/fonts.conf".source = ./fonts.conf;
}
