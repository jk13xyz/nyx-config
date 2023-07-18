## NYX_CONFIG (Work in Progress)

I'm currently in the process of switching my systems to NixOS. 

This repo is probably far from the textbook example of how one could (or perhaps should) setup their Nix configs, but this is part of the learning process. Most importantly, though, while it somewhat works for me right now, this repo is far from finished. It's very rough and barely usable still.

So, bottom line: Use it as inspiration, **don't use it for production.**

## GOAL/FEATURES
- Working modular configs for all my systems
- Leveraging Home Manager to create replicable environments
- Integrating sops-nix for secret management
- Using Wayland WM
- A combination of Hyprland + Hyprpaper + Waybar + Rofi + Mako

## CURRENT_ISSUES
- Clipboard doesn't yet work in Hyprland
- Use of Bluetooth Audio doesn't work yet
- Most features are not yet (fully) implemented

## CURRENT_SETUP

### NYX_PAD
    Lenovo ThinkPad X1 Nano Gen 2 w/ Intel Core i7-1270p + 16GB RAM
    WM/DE: Wayland + Hyprland
    Shell: zsh + oh-my-zsh + Starship
    OS Version: 23.11-unstable

### NYX_TOP (not yet started)
    Intel i5-8600K + GeForce 1070Ti + 16 GB RAM

### NYX_SERVER (not yet started)
    AMD Ryzen 7 5700G + 64GB RAM

## INSTALL

    sudo nixos-rebuild switch --flake github:jk13xyz/nyx-config#<SYSTEM> --refresh

## CREDITS/RESOURCES

#### NixOS Config/Home Manager
- [github:Misterio77/nix-config](https://github.com/Misterio77/nix-config)
- [github:Misterio77/nix-starter-config](https://github.com/Misterio77/nix-starter-config)
- [github:exploitoverload/PwNixOS](https://github.com/exploitoverload/PwNixOS/)
- [gitlab:felschr/nixos-config](https://gitlab.com/felschr/nixos-config)

#### Waybar Config
- [github:vidowner/hyprland-hdready](https://github.com/vidowner/hyprland-hdready)

#### Starship Config
- [Nerd Font Preset](https://starship.rs/presets/nerd-font.html)

#### General Resources
- [nix.dev](https://nix.dev)
- [Zero to Nix](https://zero-to-nix.com)

#### Home Manager
- [github:nix-community | Home Manager Options](https://nix-community.github.io/home-manager/options.html)
- [github:mipmip | Home Manager Options Search](https://mipmip.github.io/home-manager-option-search/?query=ncspot)

#### Misc.
- [github:drduh/YubiKey-Guide](https://github.com/drduh/YubiKey-Guide)

#### Wallpaper:
- [wallpaperup](https://www.wallpaperup.com/196208/scientific_space_planet_galaxy_stars_mac_ox_ultrahd_4k_wallpaper.html)