{ self, ... }:

{
  enable = true;
  lfs.enable = true;
  userName = self.who.name;
  userEmail = self.who.email;
  signing = { 
    signByDefault = true;
    key = "EE33E8A4879C8F5D";
  };
  extraConfig = {
    init = {
      defaultBranch = "main";
    };
    pull = {
      rebase = true;
    };
  };
}