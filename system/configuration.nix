{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.firewall.enable = false;
  networking.networkmanager.enable = true;
  networking.proxy.default = "http://127.0.0.1:1080";

  time.timeZone = "Asia/Shanghai";
  
  services.xserver = {
    enable = true;
    displayManager.autoLogin.user = "wkj";
  };
  
  services.code-server = {
    enable = true;
    user = "wkj";
  };

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
  virtualisation.libvirtd.enable = true;

  users.users.wkj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "wireshark" "docker" "libvirtd" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    virt-manager
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "22.05";
}

