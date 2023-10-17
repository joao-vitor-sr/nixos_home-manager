{ config, pkgs, ... }: {

  home.file."nvchad" = {
    source = builtins.fetchGit {
      url = "https://github.com/NvChad/NvChad.git";
      rev = "v2.0"; 
    };
    target = ".config/nvim";
    recursive = true;
    symlink = true;
  };

  home.file."custom-nvchad" = {
    source = ../configs/nvchad;
    target = ".config/nvim/lua/custom";
    recursive = true;
    symlink = true;
  };

}
