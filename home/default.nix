{ pkgs, ... }:

{
  imports = [ ./lang ./git ./font ./vim ];

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.shellAliases.update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
  };
  programs.starship.enable = true;

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
    (google-chrome.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode"; })
    vscode

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
