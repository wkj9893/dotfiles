{ pkgs, ... }:

{
  imports = [ ./lang ./git ./font ./vim ./nvim ];

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.shellAliases.update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

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
    tdesktop
    firefox-wayland
    (chromium.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode"; })
    (google-chrome.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode"; })
    (vscode.overrideAttrs
      (_: {
        version = "1.69.0";
        src = fetchurl {
          name = "VSCode_1.69.0_linux-x64.tar.gz";
          url = "https://update.code.visualstudio.com/1.69.0/linux-x64/stable";
          sha256 = "sha256-Bm//1KeDJNphX1ff4VvpVUGugH/3S6J8WRe4POSxF84=";
        };
      }))

    tmux
    tokei
    gnumake
    ripgrep
    hyperfine
    cloudflared

    foot
    waybar
    swaylock
    pulseaudio
    brightnessctl
    wl-clipboard
    rofi-wayland
    sway-contrib.grimshot
  ];
  home = {
    username = "wkj";
    homeDirectory = "/home/wkj";
    stateVersion = "22.11";
  };
}
