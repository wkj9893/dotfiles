{ pkgs, ... }:

{
  home.shellAliases.update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
  };

  home.packages = with pkgs; [
    helix
    vscode
  ];
  home = {
    username = "wkj";
    stateVersion = "22.11";
  };
}
