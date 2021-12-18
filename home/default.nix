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
    firefox-wayland
    google-chrome 
    qutebrowser

    clash
    fd
    hyperfine
    ripgrep
    tmux

    gh
    texlive.combined.scheme-full
    brightnessctl
    wl-clipboard

    alacritty
    neovim-nightly
    vscode

    deno
    rustup
    go_1_17
    nodejs-17_x
    (python310.withPackages (p: with p; [ pip adblock ]))

    noto-fonts-cjk
    sf-pro
    sf-mono

    clang-tools
    gopls
    rnix-lsp
    nixpkgs-fmt
  ];
}
