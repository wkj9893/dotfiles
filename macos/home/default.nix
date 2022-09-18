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
  
  programs.git = {
    enable = true;
    userName = "wkj";
    userEmail = "wkj9893@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };
  programs.gh.enable = true;

  home.packages = with pkgs; [
    helix
  ];

  home = {
    username = "wkj";
    stateVersion = "22.11";
  };
}
