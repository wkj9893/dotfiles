{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  programs.direnv.enable = true;

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.sessionVariables = {
    EDITOR = "vim";
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
    chromium
    firefox-wayland
    tdesktop

    gh
    tokei
    tmux
    gnumake
    ripgrep
    hyperfine
    nixpkgs-fmt
    texlive.combined.scheme-full
    
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

    deno
    cloudflared
    lazygit
    delta
  ];
}
