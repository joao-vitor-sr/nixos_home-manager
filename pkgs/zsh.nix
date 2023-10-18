{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      j = "z";
      f = "zi";
      g = "lazygit";
      ll = "lsd -l";
      ls = "lsd";
      la = "lsd -a";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -vI";
      mkd = "mkdir -pv";
      clr = "clear";
      v = "$EDITOR";
    };
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zap-zsh/vim"; }
        { name = "hlissner/zsh-autopair"; }
      ];
    };

    initExtra = ''
            bindkey '^y' autosuggest-accept
            autoload -Uz compinit
            compinit
            
      alias tmux='tmux -2'
      function tmux_launch {
          if [[ -z $TMUX ]]; then
              TMUX_CON_SESSION=__dev__
              if tmux has-session -t $TMUX_CON_SESSION 2>/dev/null; then
                  tmux -f /etc/tmux.conf -2 attach-session -t $TMUX_CON_SESSION
              else
                  tmux -f /etc/tmux.conf -2 new-session -s $TMUX_CON_SESSION
              fi
          else
          fi
      }

      alias tml='tmux_launch'
      eval "$(zoxide init zsh)"
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
