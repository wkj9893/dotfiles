self: super: rec{
  commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland --force-dark-mode";
  google-chrome = super.google-chrome.override {
    inherit commandLineArgs;
  };
  chromium = super.chromium.override {
    inherit commandLineArgs;
  };
}
