{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

    sessionVariables = {
      EDITOR = "vim";
      GOPATH = "$HOME/.local/go";
      PATH = "$PATH:$HOME/.local/go/bin";
      http_proxy = "http://127.0.0.1:1080";
      https_proxy = "http://127.0.0.1:1080";
      no_proxy = "localhost,127.0.0.1";
    };

    shellAliases = rec {
      vim = "nvim";
      update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";
    };
  };
}
