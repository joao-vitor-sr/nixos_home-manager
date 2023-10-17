{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userEmail = "joaovitorsrs7@gmail.com";
    userName = "João Vitor Silveira Ribeiro";

    extraConfig = {
      core = { whitespace = "trailing-space,space-before-tab"; };
      color = { ui = "auto"; };
      merge = { ff = "only"; };
      rerere = { enabled = "true"; };
      rebase = { autoSquash = "true"; };
      github = { user = "jvsr"; };
    };

    ignores = [ "*~" "*.pdf" "shell.nix" ];
  };


  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
  };
}
