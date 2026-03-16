{
  description = "GitHub Action to login to Akeyless and fetch secrets or provision AWS access via dynamic producers";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless-action";
        version = "0.0.0-dev";
        src = self;
        npmDepsHash = "sha256-OLy7p7WilOTm3zEAQbaSbofz3h/Aalu7vhvHXqoq/js=";
        dontNpmBuild = true;
        meta = {
          description = "GitHub Action to login to Akeyless and fetch secrets or provision AWS access via dynamic producers";
          homepage = "https://github.com/pleme-io/akeyless-action";
          license = pkgs.lib.licenses.isc;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
