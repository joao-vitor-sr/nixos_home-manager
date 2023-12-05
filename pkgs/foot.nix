{ ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "Iosevka Nerd Font Mono:size=10.5";
        dpi-aware = "yes";
        pad = "2x2";
      };
      colors = import ./colors/foot/gruvbox.nix;
    };
  };
}
