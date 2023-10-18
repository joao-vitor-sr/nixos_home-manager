{ config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = ["/home/jvsr/.config/alacritty/theme.yml"];
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
        x = 5;
        y = 5;
      };
    };
  };
}
