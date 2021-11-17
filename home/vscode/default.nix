{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      golang.go
      jnoortheen.nix-ide
      denoland.vscode-deno
      matklad.rust-analyzer
    ];
  };
  home.file.".config/Code/User/settings.json".source = ./settings.json;
}
