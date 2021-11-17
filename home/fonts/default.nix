{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts-cjk
  ];

  # https://wiki.archlinux.org/title/Localization/Simplified_Chinese
  home.file.".fonts.conf".source = ./.fonts.conf;
}
