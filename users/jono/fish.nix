{ self, ... }:
{
  enable = true;
  shellInit = ''
    set fish_greeting

    function nixos-update
      sudo nix flake update /etc/nixos
      sudo nixos-rebuild switch
    end

    function nixos-switch
      sudo nixos-rebuild switch
    end

    function nixos-commit
      sudo chmod -R 0777 /etc/nixos/.git
      git -C /etc/nixos add -i
      git -C /etc/nixos commit $argv
      sudo chmod -R 0755 /etc/nixos/.git
    end
  '';
  interactiveShellInit = ''
    starship init fish | source
    alias code codium
  '';
}