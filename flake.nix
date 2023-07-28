{

  description = "NixOS configuration";
  
    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
      nixos-hardware.url = "github:nixos/nixos-hardware/master";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      hyprland = {
        url = "github:hyprwm/Hyprland";
      };

      nur = {
        url = "github:nix-community/NUR";
      };

      sops-nix = {
        url = "github:Mic92/sops-nix";
	      inputs.nixpkgs.follows = "nixpkgs";
      };

      agenix = {
        url = "github:ryantm/agenix";
      };

      lanzaboote = {
        url = "github:nix-community/lanzaboote";
      };
     
    };

  outputs = { self, nixpkgs, nixpkgs-stable, agenix, home-manager, hyprland, lanzaboote, nur, sops-nix, ... }@inputs: 
    let
      system = "x86_64-linux";
      username = "jens";
      pkgsForSystem = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        nyx-pad  = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nyx-pad/configuration.nix
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            hyprland.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
            nur.nixosModules.nur
            inputs.sops-nix.nixosModules.sops
            {
              home-manager.users.${username} = import ./home/nyx-pad/home.nix;
            }
          ];
        };

        nyx-server  = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nyx-pad/configuration.nix
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            lanzaboote.nixosModules.lanzaboote
            inputs.sops-nix.nixosModules.sops
            {
              home-manager.users.${username} = import ./home/nyx-pad/home.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        "jens@nyx-pad" = lib.homeManagerConfiguration {
          useGlobalPkgs = true;
          useUserPackages = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
      };
  };
}
