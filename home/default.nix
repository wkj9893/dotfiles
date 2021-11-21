{ pkgs, ... }:

{
  imports = [ ./alacritty ./fonts ./git ./gtk ./neovim ./texlive ./tmux ./zsh ];
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
    gnumake
    nixpkgs-fmt
    fd
    ripgrep
    fzf
    tree
    vscode

    deno
    rustup
    go_1_17
    clang_13
    nodejs-17_x
    (python310.withPackages (p: with p; [ pip ]))
  ];
}
