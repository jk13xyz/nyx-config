{ pkgs, ... }:
{
    programs.zsh = {
        plugins = [
                {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "${pkgs.zsh-powerline10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
                }
        ];
    };
}
