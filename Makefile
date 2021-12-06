home:
	nix run .#homeManagerConfigurations.wkj.activationPackage


system:
	sudo nixos-rebuild switch --flake ~/.dotfiles 

.PHONY: home system

