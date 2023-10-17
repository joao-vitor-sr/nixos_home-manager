{ config, pkgs, ... }:
{
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
        { name = "zap-zsh/vim"; }
        { name = "hlissner/zsh-autopair"; }
      ];
    };

    initExtra = ''
      bindkey '^y' autosuggest-accept
      autoload -Uz compinit
      compinit
    '';
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

}
