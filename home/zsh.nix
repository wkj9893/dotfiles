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
    };

    shellAliases = rec {
      update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";
    };
  };
}
