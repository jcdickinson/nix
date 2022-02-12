{ pkgs, ... }:

{
  enable = true;
  package = pkgs.vscodium;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    vadimcn.vscode-lldb
    matklad.rust-analyzer
  ];
}