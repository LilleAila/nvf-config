{
  description = "My standalone neovim configuration in nvf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors = {
      url = "github:misterio77/nix-colors";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      pkgsFor = lib.genAttrs systems (system: import nixpkgs { inherit system; });
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    in
    {
      packages = forEachSystem (pkgs: rec {
        default = nvf-config;
        nvf-config = pkgs.callPackage ./pkgs/nvf-config.nix {
          inherit inputs;
          inherit (self) outputs;
          colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
        };
        snippets = pkgs.callPackage ./pkgs/snippets.nix { };
        inspect = pkgs.writeShellApplication {
          name = "nvf-inspect-config";
          text = ''nvim "$(${nvf-config}/bin/nvf-print-config-path)"'';
        };
      });

      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
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
