{
  description = "Catos erste NixOS Flake";

  # Hier definieren wir, woher die Pakete kommen sollen.
  # Wir nutzen hier den aktuellen stabilen Zweig (24.11).
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  # Hier wird das eigentliche System zusammengebaut
  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # "nixos" MUSS mit deinem networking.hostName übereinstimmen!
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Hier laden wir deine alten Dateien in die Flake
          ./hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
  };
}
