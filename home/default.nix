{ pkgs, ... }:

{
  programs.home-manager = {
    enable = true;
  };

  imports = [ ./zsh ];

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.file.".vimrc".source = ./vimrc;

  fonts.fontconfig.enable = true;

  xdg.userDirs = {
    enable = true;
    desktop = "$HOME";
    documents = "$HOME";
    download = "$HOME";
    music = "$HOME";
    pictures = "$HOME";
    publicShare = "$HOME";
    templates = "$HOME";
    videos = "$HOME";
  };

  home.packages = with pkgs; [
    google-chrome
    chromium
    firefox-wayland
    electron
    nodePackages.pnpm

    fd
    hyperfine
    ripgrep
    tokei
    tmux
    patchelf

    _7zz
    gh
    texlive.combined.scheme-full
    brightnessctl
    wl-clipboard

    alacritty
    vscodium

    clang_13
    deno
    go_1_17
    nodejs-17_x

    source-han-sans
    sf-pro
    sf-mono
  ];
}
