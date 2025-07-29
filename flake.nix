{ description = "westonb's NixOS config";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true;};
    in {
      # empty default packages/output
      }
    ) // {
    nixosConfigurations = {
      jupiter = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/jupiter/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.westonb = import ./home-manager/modules/sway-desktop.nix;

          }
        ];
      };
      # vulcan = nixpkgs.lib.nixosSystem {
        # system = "x86_64-linux";
        # modules = [
          # ./hosts/vulcan/configuration.nix
          # home-manager.nixosModules.home-manager
          # {
            # home-manager.useGlobalPkgs = true;
            # home-manager.useUserPackages = true;
            # home-manager.users.westonb = import ./hosts/vulcan/home.nix;

          # }
        # ];
      # };

    };
  };
}
