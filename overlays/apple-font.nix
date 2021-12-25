self: super: {
  sf-pro = super.pkgs.stdenv.mkDerivation
    {
      pname = "sf-pro";
      version = "1.0";

      src = super.pkgs.fetchurl {
        url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
        sha256 = "sha256-m0eDv1CYCkkm5qgbLioI9+ahf0OXSYh0Gkp61vgMSFk=";
      };

      nativeBuildInputs = [ super.pkgs._7zz ];

      unpackCmd = ''
        7zz x $curSrc
        find . -name "*.pkg" -print -exec 7zz x {} \;
        find . -name "Payload~" -print -exec 7zz x {} \;
      '';

      sourceRoot = "./Library/Fonts";

      dontBuild = true;

      installPhase = ''
        find . -name '*.ttf' -exec install -m444 -Dt $out/share/fonts/truetype {} \;
        find . -name '*.otf' -exec install -m444 -Dt $out/share/fonts/opentype {} \;
      '';
    };
  sf-mono = super.pkgs.stdenv.mkDerivation
    {
      pname = "sf-mono";
      version = "1.0";

      src = super.pkgs.fetchurl {
        url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
        sha256 = "sha256-8niJPk3hGfK1USIs9eoxZ6GlM4aZ7ZObmQj2Zomj+Go=";
      };

      nativeBuildInputs = [ super.pkgs._7zz ];

      unpackCmd = ''
        7zz x $curSrc
        find . -name "*.pkg" -print -exec 7zz x {} \;
        find . -name "Payload~" -print -exec 7zz x {} \;
      '';

      sourceRoot = "./Library/Fonts";

      dontBuild = true;

      installPhase = ''
        find . -name '*.ttf' -exec install -m444 -Dt $out/share/fonts/truetype {} \;
        find . -name '*.otf' -exec install -m444 -Dt $out/share/fonts/opentype {} \;
      '';
    };

}
