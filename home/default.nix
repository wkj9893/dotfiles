{ pkgs, ... }:

{
  imports = [ ./lang ./font ./firefox.nix ./git.nix ./vim.nix ];

  home.file.".config" = {
    recursive = true;
    source = ../config;
  };

  home.shellAliases.update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    EDITOR = "vim";
  };

  programs.zsh = {
    enable = true;
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
    (google-chrome.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode --enable-features=Vulkan,VaapiVideoDecoder,VaapiVideoEncoder"; })
    (google-chrome-dev.override { commandLineArgs = "--ozone-platform-hint=auto --force-dark-mode --enable-features=Vulkan,VaapiVideoDecoder,VaapiVideoEncoder"; })
    vscode
    helix

    tmux
    tokei
    gnumake
    ripgrep
    hyperfine
    dnsutils
    cloudflared
    linux-wifi-hotspot

    foot
    waybar
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
