{
  description = "GitHub Action to login to Akeyless and fetch secrets or provision AWS access via dynamic producers";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "akeyless-action";
    npmDepsHash = "sha256-OLy7p7WilOTm3zEAQbaSbofz3h/Aalu7vhvHXqoq/js=";
    dontNpmBuild = true;
    description = "GitHub Action to login to Akeyless and fetch secrets or provision AWS access via dynamic producers";
  };
}
