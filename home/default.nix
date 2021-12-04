{ pkgs, ... }:

{
  imports = [ ./alacritty ./fonts ./git ./gtk ./neovim ./sway ./tmux ./vscode ./zsh ];
  programs.home-manager = {
    enable = true;
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
    firefox-wayland
    (pkgs.google-chrome.override { commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --force-dark-mode"; })
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

    deno
    rustup
    go_1_17
    nodejs-17_x
    (python310.withPackages (p: with p; [ pip ]))
  ];
}
