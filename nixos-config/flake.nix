{
  description = "Meine NixOs Systeme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-25-11.url = "github:nixos/nixpkgs/nixos-25.11";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
	# Wichtig
        ./hardware-configuration.nix

	# Abspaltung  
        ./configuration.nix
	./nvidia.nix
	./fonts.nix
	./apps_main.nix
	./unstable-packages.nix
	./programs.nix
	./services.nix
	./hardware.nix

	# Add-Ons  
	./pixiesddm.nix
        ./spicetify.nix
	./zen-browser.nix

        inputs.spicetify-nix.nixosModules.default
      ];
    };
  };
}
