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
        };

        zplug = {
            enable = true;
            plugins = [
                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ];  }
            ];
        };

        initExtra = ''
          POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
	  source ~/.p10k.zsh
        '';

        shellAliases = {
            # General
            c = "clear";
            ll = "ls -al";

            # Git
	    add = "git add --all";
            fetch = "git fetch";
            push = "git push";
            pull = "git pull";
        };
    };

    home.file.".p10k.zsh".source = ./p10k.zsh;

}
