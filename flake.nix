{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs }: rec {
    system = "x86_64-linux";
    username = "wkj";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
      overlays = [ (import ./overlays/apple-font.nix) ];
    };

    homeManagerConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
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

    nixosConfigurations.great-beams = nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      modules = [ ./great-beams/configuration.nix ];
    };

  };
}
