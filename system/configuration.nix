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

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
    ];
  };

  hardware.bluetooth.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.docker.enable = true;
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  users.users.wkj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "wireshark" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    gcc
  ];

  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = "22.11";
}

