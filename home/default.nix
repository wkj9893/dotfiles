{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.sessionVariables = {
    EDITOR = "vim";
    GOPATH = "$HOME/.local/go";
    PATH = "$PATH:$HOME/.local/go/bin";
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

    shellAliases = rec {
      update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font = {
      name = "SF Pro Text";
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
    cursorTheme = {
      size = 16;
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
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
    (google-chrome.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode"; })
    firefox-wayland
    tdesktop

    gh
    tmux
    tokei
    neovim
    gnumake
    ripgrep
    hyperfine
    nixpkgs-fmt
    cloudflared
    texlive.combined.scheme-full

    source-han-sans
    sf-pro
    sf-mono
    
    go_1_18
    deno
    nodejs-18_x
    nodePackages.pnpm
    clang_14
    cargo 
    rustc

    foot
    waybar
    swaylock
    pulseaudio
    brightnessctl
    wl-clipboard
    rofi-wayland
    sway-contrib.grimshot

    openvscode-server
  ];
}
