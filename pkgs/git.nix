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

  home.packages = with pkgs; [ lazygit ];
}
