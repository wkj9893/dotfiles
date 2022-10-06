{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
    "net.core.rmem_max" = 2500000;
  };
  networking.hostName = "great-beams";
  networking.firewall.enable = false;

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP6P9EejBPXJ9BCEoLAXWZTKC2xlIgOJZgkSq/mWLhwn wkj9893@gmail.com"
  ];

  services.tailscale.enable = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    tmux
    go_1_19
  ];

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "22.11";
}

