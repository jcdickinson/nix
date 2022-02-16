{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jonopkgs = {
      url = "github:jcdickinson/flakes";
    };
  };

  outputs = { self, nixpkgs, home-manager, jonopkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
  in
  {
    nixosConfigurations.jono-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs pkgs; };
      modules = [
        ./systems/jono-desktop.nix
        ./users/jono.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jono = import ./users/jono/home.nix { jonopkgs = jonopkgs; };
        }
      ];
    };
    nixosConfigurations.jono-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs pkgs; };
      modules = [
        ./systems/jono-laptop.nix
        ./users/jono.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jono = import ./users/jono/home.nix { jonopkgs = jonopkgs; };
        }
      ];
    };
  };
}
