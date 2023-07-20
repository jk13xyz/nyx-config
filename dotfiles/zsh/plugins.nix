{ pkgs, ... }:
{
    programs.zsh = {
        zplug = {
            enable = true;
            plugins = [
                { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ];  }
            ];
        };
    };
}
