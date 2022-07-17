{ pkgs, ... }:

{
  imports = [ ./c.nix ./go.nix ./js.nix ./py.nix ./nix.nix ./rust.nix ];
}
