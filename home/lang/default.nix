{ pkgs, ... }:

{
  imports = [ ./go.nix ./js.nix ./py.nix ./nix.nix ./rust.nix ];
}
