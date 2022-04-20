{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.proxy.default = "http://127.0.0.1:1080";

  time.timeZone = "Asia/Shanghai";

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };
  
  services.code-server = {
    enable = true;
    user = "wkj";
  };

  services.tailscale.enable = true;
  security.sudo.wheelNeedsPassword = false;

  programs.sway = {
    enable = true;
    extraPackages = [ ];
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  virtualisation.docker.enable = true;

  users.users.wkj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "wireshark" "docker" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "22.05";
}

