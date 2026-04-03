{
  description = "1. Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
	  ./fonts.nix
	  ./apps.nix
	  ./programs.nix
	  ./services.nix
	  ./pixiesddm.nix
        ];
      };
    };
  };
}
