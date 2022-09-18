{ pkgs, ... }:

{
  imports = [ ./homebrew.nix ];

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  nix.extraOptions = "experimental-features = nix-command flakes";
  system.stateVersion = 4;
}
