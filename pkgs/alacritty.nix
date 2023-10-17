{ config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      # set the dracula theme 
      colors = {
        primary = {
          background = "#282a36";
          foreground = "#f8f8f2";
        };
        normal = {
          black = "#21222c";
          red = "#ff5555";
          green = "#50fa7b";
          yellow = "#f1fa8c";
          blue = "#bd93f9";
          magenta = "#ff79c6";
          cyan = "#8be9fd";
          white = "#f8f8f2";
        };
        bright = {
          black = "#6272a4";
          red = "#ff6e6e";
          green = "#69ff94";
          yellow = "#ffffa5";
          blue = "#d6acff";
          magenta = "#ff92df";
          cyan = "#a4ffff";
          white = "#ffffff";
        };
      };
      
      dynamic_padding = true;
      live_config_reload = true;
      env = { TERM = "xterm-256color"; };
      font = {
        normal = {
          family = "Iosevka Nerd Font";
          style = "Regular";
        };
        size = 12;
      };
      window.opacity = 1.0;
      window.padding = {
        x = 0;
        y = 0;
      };
    };
  };
}
