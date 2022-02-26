{ jonopkgs, ... }:
{ config, pkgs, ... }@attrs:

let
  next = attrs // { inherit jonopkgs; self = import ./self.nix {}; };
  self = next.self;
in
{
  home.username = self.who.username;
  home.homeDirectory = self.who.homeDirectory;

  programs = {
    vscode = import ./vscode.nix next;
    git = import ./git.nix next;
    fish = import ./fish.nix next;
    kitty = import ./kitty.nix next;
  };
  
  gtk = import ./gtk.nix next;

  dconf.settings = import ./dconf.nix next;

  services = {
    gpg-agent = import ./gpg-agent.nix next;
  };

  home.packages = import ./packages.nix next;

  home.file = import ./files.nix next;

  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}
