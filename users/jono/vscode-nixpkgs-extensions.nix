{ pkgs, ... }:
with pkgs.vscode-extensions; [  dhall.dhall-lang
  dhall.vscode-dhall-lsp-server
  matklad.rust-analyzer
  tamasfe.even-better-toml
  vadimcn.vscode-lldb
  arrterian.nix-env-selector
  eamodio.gitlens
]