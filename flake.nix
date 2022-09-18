{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, flake-utils, home-manager, darwin, ... }: flake-utils.lib.eachDefaultSystem (system:
    rec {
      username = "wkj";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [ (import ./overlays/apple-font.nix) ];
      };

      packages.homeManagerConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
      };

      packages.nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home;
          }
        ];
      };

      packages.nixosConfigurations.great-beams = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [ ./great-beams/configuration.nix ];
      };

      packages.darwinConfigurations.wkj = darwin.lib.darwinSystem {
        inherit system pkgs;
        modules = [
          ./macos/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./macos/home;
          }
        ];
      };

    }
  );
}
