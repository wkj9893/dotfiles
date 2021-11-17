{ ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    sessionVariables = {
      CARGO_HOME = "$HOME/.local/cargo";
      RUSTUP_HOME = "$HOME/.local/rustup";
      GOPATH = "$HOME/.local/go";

      EDITOR = "nvim";
    };

    shellAliases = {
      ll = "ls -l";
      code = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
      update = "pushd ~/.dotfiles && sudo nixos-rebuild switch --flake . && popd";
    };

    initExtra = "eval \"$(starship init zsh)\"";
  };
  programs.starship.enable = true;
}
