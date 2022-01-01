{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };
  virtualisation.docker.enable = true;

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [ swaylock waybar ];
    extraSessionCommands = "export GTK_THEME=Adwaita:dark";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.wkj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    git
    gcc11
    gnumake
    _7zz
    htop
  ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "22.05";
}

