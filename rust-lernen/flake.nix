{
  description = "1. Rust devShell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    { 
 #     packages."x86_64-linux".default = pkgs.rustPlatform.buildRustPackage {
  #      name = "themeswitcher";
#	src = ./.;
#	buildInputs = [pkgs.glib ];
#	nativeBuildInputs = [pkgs.pkg-config ];
#	cargoHash = pkgs.lib.fakeHash;
#      };	
      devShells.${system}.default = pkgs.mkShell {
        
        buildInputs = with pkgs; [
          cargo         # Rust Paketmanager
          rustc         # Rust Compiler
          rustfmt       # Formatiert den Code 
          clippy        # Sucht nach Fehlern 
          rust-analyzer # VS Code / Neovim Integration
	  cargo-generate
	  openssl_oqs

	  # Wayland
	  wayland
	  libxkbcommon
	  libGL
	  gtk4
	  pango
	  gdk-pixbuf
	  gdk
	  glib
	  atk
	  cairo
        ];

        shellHook = ''
	  export LD_LIBRARY_PATH="${pkgs.wayland}/lib:${pkgs.libGL}/lib:${pkgs.libxkbcommon}/lib:$LD_LIBRARY_PATH"
          echo "🦀 Hello Rust 🦀"
        '';
      };
  };
}
