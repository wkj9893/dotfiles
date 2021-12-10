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

  home.sessionVariables = {
    GTK_THEME=Adwaita:dark;
  };

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
    alacritty
    firefox-wayland
    (pkgs.google-chrome.override { commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland"; })
    clash
    exa
    bat
    nixpkgs-fmt
    fd
    ripgrep
    hyperfine
    fzf
    texlive.combined.scheme-full
    gh
    qutebrowser
    meson
    brightnessctl 

    neovim
    vscode
    tmux

    deno
    rustup
    go_1_17
    nodejs-17_x
    (python310.withPackages (p: with p; [ pip adblock ]))

    noto-fonts-cjk
    cascadia-code

  ];
}
