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

      sops-nix = {
        url = "github:Mic92/sops-nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      agenix = {
        url = "github:ryantm/agenix";
      };

      
    };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, agenix, home-manager, hyprland, sops-nix, ... }: 
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
            home-manager.nixosModules.home-manager
            hyprland.nixosModules.default
            sops-nix.nixosModules.sops
            agenix.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jens = import ./home/jens/home.nix;
              }
          ];
         };
       };
     };
}
