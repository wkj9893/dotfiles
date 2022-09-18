{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    global.brewfile = true;
    global.autoUpdate = false;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;

    brews = [
    ];
    casks = [
      "visual-studio-code"
      "google-chrome"
      "steam"
      "telegram-desktop"
    ];
  };
}
