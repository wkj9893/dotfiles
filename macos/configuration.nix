{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
  ];

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  nix.extraOptions = "experimental-features = nix-command flakes";
  system.stateVersion = 4;
}
