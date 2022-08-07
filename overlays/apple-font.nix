self: super: rec {
  nativeBuildInputs = [ super.pkgs._7zz ];

  unpackCmd = ''
    7zz x $curSrc
    find . -name "*.pkg" -exec 7zz x {} \;
    find . -name "Payload~" -exec 7zz x {} \;
  '';

  sourceRoot = "./Library/Fonts";

  installPhase = ''
    find . -name '*.ttf' -exec install -m444 -Dt $out/share/fonts/truetype {} \;
    find . -name '*.otf' -exec install -m444 -Dt $out/share/fonts/opentype {} \;
  '';

  sf-pro = super.stdenv.mkDerivation
    {
      pname = "sf-pro";
      version = "1.0";

      src = super.fetchurl {
        url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
        sha256 = "sha256-o1Zis9kymOicTyDdTPGON2A5LNpDbgOD1XtyQOdxc0M=";
      };

      inherit nativeBuildInputs unpackCmd sourceRoot installPhase;
    };
  sf-mono = super.stdenv.mkDerivation
    {
      pname = "sf-mono";
      version = "1.0";

      src = super.pkgs.fetchurl {
        url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
        sha256 = "sha256-jnhTTmSy5J8MJotbsI8g5hxotgjvyDbccymjABwajYw=";
      };

      inherit nativeBuildInputs unpackCmd sourceRoot installPhase;
    };
}
