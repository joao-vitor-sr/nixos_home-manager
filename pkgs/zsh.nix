{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      j = "z";
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
    plugins = with pkgs; [
      {
        name = "agkozak-zsh-prompt";
        src = fetchFromGitHub {
          owner = "agkozak";
          repo = "agkozak-zsh-prompt";
          rev = "v3.7.0";
          sha256 = "1iz4l8777i52gfynzpf6yybrmics8g4i3f1xs3rqsr40bb89igrs";
        };
        file = "agkozak-zsh-prompt.plugin.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autopair";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
        file = "autopair.zsh";
      }
    ];

    initExtra = ''
            bindkey '^y' autosuggest-accept
            autoload -Uz compinit
            compinit
            
      alias tmux='tmux -2'
      function tmux_launch {
          if [[ -z $TMUX ]]; then
              TMUX_CON_SESSION=__dev__
              if tmux has-session -t $TMUX_CON_SESSION 2>/dev/null; then
                  tmux -f $HOME/.config/tmux/tmux.conf -2 attach-session -t $TMUX_CON_SESSION
              else
                  tmux -f $HOME/.config/tmux/tmux.conf -2 new-session -s $TMUX_CON_SESSION
              fi
          else
          fi
      }

      alias tml='tmux_launch'
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

}
