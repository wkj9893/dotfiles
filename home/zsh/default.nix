{ ... }:

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
      http_proxy = "socks5://127.0.0.1:7890";
      https_proxy = "socks5://127.0.0.1:7890";
    };

    shellAliases = rec {
      ls = "ls --group-directories-first";
      code = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
      update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";
      update-system = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
  };
}
