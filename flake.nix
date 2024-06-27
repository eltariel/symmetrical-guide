{
  description = "Ellie's system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      username = "ellie";


      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      homePrefix = if pkgs.stdenv.hostPlatform.isDarwin then "Users" else "home";
      homeDirectory = "/${homePrefix}/${username}";
      specialArgs = {
        inherit inputs self nix-darwin pkgs username homeDirectory;
      };
    in
    {
      darwinConfigurations = {
        "E1M1" = nix-darwin.lib.darwinSystem {
          inherit system specialArgs;
          modules = [
            ./configuration.nix
            ./homebrew.nix

            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./users/ellie.nix;
            }
          ];
        };
      };
    };
}
