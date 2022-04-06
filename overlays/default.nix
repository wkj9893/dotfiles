self: super: rec {
  sway-unwrapped = super.sway-unwrapped.overrideAttrs (old: rec {
    version = "1.6.1";
    src = super.fetchFromGitHub {
      owner = "swaywm";
      repo = "sway";
      rev = version;
      sha256 = "0j4sdbsrlvky1agacc0pcz9bwmaxjmrapjnzscbd2i0cria2fc5j";
    };
  });
  wlroots = super.wlroots.overrideAttrs (old: rec {
    version = "0.14.1";
    src = super.fetchFromGitLab {
      owner = "wlroots";
      repo = "wlroots";
      rev = version;
      sha256 = "1sshp3lvlkl1i670kxhwsb4xzxl8raz6769kqvgmxzcb63ns9ay1";
    };
  });
}
