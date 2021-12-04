{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sway
    waybar
  ];
  # home.file.".config/tmux/tmux.conf".source = ./tmux.conf;
}
