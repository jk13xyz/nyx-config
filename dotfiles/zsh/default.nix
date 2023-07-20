{ config, pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableAutosuggestions = true;
        syntaxHighlighting = {
            enable = true;
        };

        oh-my-zsh = {
            enable = true;
            plugins = [ "git"  ];
        };

        shellAliases = {
            # General
            c = "clear";
            ll = "ls -al";

            # Git
	    add = "git add --all";
            commit = "git commit -m $1";
            fetch = "git fetch";
            push = "git push";
            pull = "git pull";

            # NixOS
            nshell = "nix-shell -p $1";
            install = "nix-env -iA $1";
            nsw = "sudo nixos-rebuild switch --flake github:jk13xyz/nyx-config#$1 --refresh";
        };
    };

}
