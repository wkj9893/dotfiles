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
  };
}
