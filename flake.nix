{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, neovim-nightly-overlay }:
  let
    overlays = [
      neovim-nightly-overlay.overlays.default
    ];
  in
  {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      modules = [ 
        {
          nixpkgs.overlays = overlays;
        }
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.weston = ./nixos/home.nix;
        }
      ];
    };
    
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit self;
      };

      modules = [ 
        {
	  nixpkgs.overlays = overlays;
	}
        ./mac/configuration.nix
	home-manager.darwinModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.weston = ./mac/home.nix;
	}
      ];
    };
    
  };
}
