{ ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

    sessionVariables = {
      CARGO_HOME = "$HOME/.local/cargo";
      RUSTUP_HOME = "$HOME/.local/rustup";
      GOPATH = "$HOME/.local/go";
      EDITOR = "nvim";
      http_proxy = "http://localhost:7890";
      https_proxy = "http://localhost:7890";
      MANPAGER = "nvim +Man!";
    };

    shellAliases = {
      ll = "ls -l";
      code = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
      update = "pushd ~/.dotfiles && sudo nixos-rebuild switch --flake . && popd";
    };

  };
}
