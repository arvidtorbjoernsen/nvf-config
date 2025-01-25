{
  description = "My standalone neovim configuration in nvf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plugin-blink-emoji = {
      url = "github:moyiz/blink-emoji.nvim";
      flake = false;
    };
    plugin-blink-cmp-spell = {
      url = "github:ribru17/blink-cmp-spell";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      );
    in
    {
      packages = forEachSystem (pkgs: rec {
        default = nvf-config;
        nvf-config = pkgs.callPackage ./pkgs/nvf-config.nix {
          inherit (self) outputs;
          inherit inputs;
        };
        snippets = pkgs.callPackage ./pkgs/snippets.nix { };
      });

      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          NIX_CONFIG = "extra-experimental-features = nix-command flakes ca-derivations";
          nativeBuildInputs = with pkgs; [
            nixd
            nixfmt-rfc-style
            statix
            lua-language-server
            # stylua # TODO: configure (spaces instead of tabs)
          ];
        };
      });
    };
}
