{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.default.settings = {
      "browser.toolbars.bookmarks.visibility" = "never";
      "font.default.x-western" = "sans-serif";
      "font.name.serif.x-western" = "SF Pro Text";
      "font.name.sans-serif.x-western" = "SF Pro Text";
      "font.name.monospace.x-western" = "Iosevka Fixed";
    };
  };
}
