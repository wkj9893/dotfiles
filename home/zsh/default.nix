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
      CARGO_HOME = "$HOME/.local/cargo";
      RUSTUP_HOME = "$HOME/.local/rustup";
      GOPATH = "$HOME/.local/go";
      EDITOR = "vim";
      http_proxy = "http://localhost:7890";
      https_proxy = "http://localhost:7890";
    };

    shellAliases = rec {
      ls = "ls --group-directories-first";
      code = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
      sound = "pactl set-sink-volume @DEFAULT_SINK@";
      update-home = "nix run ~/.dotfiles#homeManagerConfigurations.wkj.activationPackage";
      update-system = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
  };
}
