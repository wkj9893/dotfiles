self: super: {
  google-chrome = super.google-chrome.override {
    commandLineArgs =
      "--enable-features=UseOzonePlatform --ozone-platform=wayland --force-dark-mode";
  };
}
