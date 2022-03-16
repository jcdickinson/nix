{ pkgs, ... }:
with pkgs.vscode-extensions; [  arrterian.nix-env-selector
  dhall.dhall-lang
  dhall.vscode-dhall-lsp-server
  eamodio.gitlens
  matklad.rust-analyzer
  tamasfe.even-better-toml
  vadimcn.vscode-lldb
]