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
            plugins = [ "gh" "git" "git-auto-fetch" ];
            theme = "powerlevel10k/powerlevel10k";
        };

        plugins = [
        {
            name = "powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
            name = "powerlevel10k-config";
            src = ./p10k-config;
            file = "p10k.zsh";
        }
        ];  

#        zplug = {
#            enable = true;
#            plugins = [
#                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ];  }
#            ];
#        };        

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
