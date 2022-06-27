{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
    "net.core.rmem_max" = 2500000;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Asia/Shanghai";

  networking = {
    useNetworkd = true;
    firewall.enable = false;
    wireless.iwd.enable = true;
    proxy.default = "http://127.0.0.1:1080";
  };

  services.tailscale.enable = true;

  services.xserver = {
    enable = true;
    displayManager.autoLogin.user = "wkj";
  };

  security.sudo.wheelNeedsPassword = false;

  programs.sway = {
    enable = true;
    extraPackages = [ ];
  };

  hardware.bluetooth.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  users.users.wkj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    gcc
    virt-manager
  ];

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "22.11";
}

