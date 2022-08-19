{ ... }:

{
  programs.git = {
    enable = true;
    userName = "wkj";
    userEmail = "wkj9893@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };
  programs.gh.enable = true;
}
