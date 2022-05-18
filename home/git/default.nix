{ ... }:

{
  programs.git = {
    enable = true;
    userName = "wkj";
    userEmail = "wkj9893@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;
  programs.lazygit.enable = true;
}
