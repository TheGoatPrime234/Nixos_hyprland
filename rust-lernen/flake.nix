{
  description = "1. Rust devShell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        
        buildInputs = with pkgs; [
          cargo         # Rust Paketmanager
          rustc         # Rust Compiler
          rustfmt       # Formatiert den Code 
          clippy        # Sucht nach Fehlern 
          rust-analyzer # VS Code / Neovim Integration
        ];

        shellHook = ''
          echo "🦀 Hello Rust 🦀"
        '';
      };
    };
}
