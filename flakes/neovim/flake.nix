{
  description = "neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    neovim = {
      url = "github:neovim/neovim";
      flake = false;
    };
  };

  outputs = { nixpkgs, neovim, ... }: rec {
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    defaultPackage.x86_64-linux = pkgs.neovim-unwrapped.overrideAttrs (oa: {
      version = "master";
      src = neovim;
    });
  };
}
