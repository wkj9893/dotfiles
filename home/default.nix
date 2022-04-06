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

    tokei
    ripgrep
    hyperfine
    tdesktop

    gh
    brightnessctl

    neovim
    alacritty
    texlive.combined.scheme-full

    deno
    gcc11
    rustup
    go_1_18
    python3
    nodejs-17_x
    nodePackages.pnpm

    source-han-sans
    sf-pro
    sf-mono
  ];
}
