{ ... }: {
  programs.zathura = {
    enable = true;
    options = import ./colors/zathura/gruvbox.nix;
    mappings = {
        "I" = "index";
      };
  };
}
