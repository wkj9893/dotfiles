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
    brave
    (google-chrome.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode"; })
    ((vscode.override { isInsiders = true; }).overrideAttrs
      (oldAttrs: {
        src = (builtins.fetchTarball {
          url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
          sha256 = "06qnzv8b7id4si4fkvcbg78pp3w770kfx6cfh25mjgwb2gj8mfz6";
        });
        version = "latest";
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
