{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [ ./zsh.nix ];

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.file.".vimrc".source = ./vimrc;

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
    google-chrome
    chromium
    tdesktop

    gh
    tokei
    tmux
    neovim
    gnumake
    ripgrep
    hyperfine
    nixpkgs-fmt
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

    foot
    waybar
    swaylock
    brightnessctl
    wl-clipboard
    rofi-wayland
    sway-contrib.grimshot
  ];
}
