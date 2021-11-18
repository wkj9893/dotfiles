{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts-cjk
    (nerdfonts.override {
      fonts = [ "CascadiaCode" ];
    })
  ];

  # https://wiki.archlinux.org/title/Localization/Simplified_Chinese
  home.file.".fonts.conf".source = ./.fonts.conf;
}
