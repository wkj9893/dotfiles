{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-flake = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { home-manager, nixpkgs, neovim-flake, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [
            (self: super: {
              neovim-nightly = neovim-flake.packages."x86_64-linux".neovim;
            })
          ];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wkj = import ./home;
        }
      ];
    };
  };
}
