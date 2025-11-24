{
  description = "westonb's NixOS config";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    flake-utils,
    neovim-nightly-overlay,
    ...
  }:
  let
    overlays = [
      neovim-nightly-overlay.overlays.default
    ];
  in
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

      in {
        # empty default packages/output
      }
    )
    // {
      nixosConfigurations = {
        jupiter = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/jupiter/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.westonb = {
                imports = [
                  ./home-manager/common.nix
                ];
              };
            }
          ];
        };
        vulcan = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
	    {
	      nixpkgs.overlays = overlays;
	    }
            ./hosts/vulcan/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.westonb = import ./home-manager/common.nix;
            }
          ];
        };

        pluto = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/pluto/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.westonb = import ./home-manager/common.nix;
            }
          ];
        };
      };
    };
}
