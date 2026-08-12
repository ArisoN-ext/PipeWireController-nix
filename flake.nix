{
  description = "PipeWireController flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }: {
    packages =
      nixpkgs.lib.genAttrs
        [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
        (system: {
          default = nixpkgs.legacyPackages.${system}.callPackage ./default.nix { };
        });
  };
}
