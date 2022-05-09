{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ... }: rec {
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
      overlays = [ (import ./overlays/apple-font.nix) ];
    };

    homeManagerConfigurations.wkj = home-manager.lib.homeManagerConfiguration {
      inherit system pkgs;
      homeDirectory = "/home/wkj";
      username = "wkj";
      configuration.imports = [ ./home ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wkj = import ./home;
          nix.registry.nixpkgs.flake = nixpkgs; 
        }
      ];
    };
  };
}
