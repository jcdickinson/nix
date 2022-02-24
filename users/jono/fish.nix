{ self, ... }:
{
  enable = true;
  shellInit = ''
    set fish_greeting
  '';
  interactiveShellInit = ''
    starship init fish | source

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

    function code
      set rp (realpath $argv[1])
      xdg-open vscode://file$rp
    end
  '';
}