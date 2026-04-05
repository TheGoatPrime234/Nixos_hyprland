{
  description = "Meine NixOs Systeme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
	modules = [
	  ./hardware-configuration-nixos.nix
	  ./configuration.nix
	];
      };	
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
        modules = [
	# Wichtig
          ./hardware-configuration-desktop.nix

	# Abspaltung  
          ./configuration.nix
	  ./nvidia.nix
	  ./fonts.nix
	  ./apps.nix
	  ./programs.nix
	  ./services.nix
	  ./hardware.nix

	# Add-Ons  
	  ./pixiesddm.nix
	  ./spicetify.nix

	  inputs.spicetify-nix.nixosModules.default
        ];
      };
      chromebook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs; };
	modules = [
	# Wichtig
	  ./hardware-configuration-chromebook.nix

	# Absplatung
	  ./configuration.nix
	  
	  ./fonts.nix
	  ./apps.nix
	  ./programs.nix
	  ./services.nix
	  ./hardware.nix

	# Add-Ons
	  ./pixiesddm.nix
	  ./spicetify.nix

	  inputs.spicetify-nix.nixosModules.default
	];
      };	
    };
  };
}
