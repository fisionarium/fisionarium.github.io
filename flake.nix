{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    # nixpkgs.url = "github:nixos/nixpkgs/05bbf675397d5366259409139039af8077d695ce";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    treefmt-nix,
    ...
  }:
    let
      inherit (nixpkgs) lib;
      systems = lib.genAttrs lib.systems.doubles.all (any: any);
      eachSystem = lib.genAttrs [ systems.x86_64-linux ];
      eachSystemPkgs = f: eachSystem (system: f nixpkgs.legacyPackages.${system});
      
      # Formatting configuration and build
      treefmtConfig = {
        projectRootFile = "flake.nix";
        programs = {
          alejandra.enable = true;
          deadnix.enable = true;
          prettier.enable = true;
        };
      };
      treefmtBuild = eachSystemPkgs (pkgs: (treefmt-nix.lib.evalModule pkgs treefmtConfig).config.build);
    in
    {
      formatter = eachSystem (system: treefmtBuild.${system}.wrapper);
      checks = eachSystem (system: {
        formatting = treefmtBuild.${system}.check self;
      });
      devShells = eachSystemPkgs (
        pkgs:
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              hugo
            ];
          };
        }
      );
    };
}
