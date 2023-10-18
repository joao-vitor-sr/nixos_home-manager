{ config, pkgs, ... }:

{
  home.username = "jvsr";
  home.homeDirectory = "/home/jvsr";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    zathura
    fzf
    bitwarden
    tealdeer
    qbittorrent
    webcord
    ripgrep
  ];

  home.file = { };

  home.file.".config/hypr/" = {
    recursive = true;
    source = ./configs/hypr;
    target = ".config/hypr";
  };

  home.file.".config/alacritty" = {
    source = ./configs/alacritty_theme.yml;
    target = ".config/alacritty/theme.yml";
  };

  home.file.".config/waybar/" = {
    recursive = true;
    source = ./configs/waybar;
    target = ".config/waybar";
  };

  home.file.".config/wofi/" = {
    recursive = true;
    source = ./configs/wofi;
    target = ".config/wofi";
  };

  home.file.".config/kmonad/" = {
    recursive = true;
    source = ./configs/kmonad;
    target = ".config/kmonad";
  };

  home.file.".local/bin/" = {
    recursive = true;
    source = ./configs/bin;
    target = ".local/bin";
  };

  home.file.".config/wlogout/" = {
    recursive = true;
    source = ./configs/wlogout;
    target = ".config/wlogout";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    PATH = "$HOME/.local/bin:$(yarn global bin):$PATH";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    LIBSEAT_BACKEND = "logind";
    NIXPKGS_ALLOW_BROKEN = "1";
    NIXPKGS_ALLOW_UNFREE = "1";
    MOZ_ENABLE_WAYLAND = "1";

    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    WINEPREFIX = "$XDG_DATA_HOME/wineprefixes/default";

    PARALLEL_HOME = "$XDG_CONFIG_HOME/parallel";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
    SQLITE_HISTORY = "$XDG_DATA_HOME/sqlite_history";

    QT_QPA_PLATFORM = "wayland";
    XDG_DATA_DIRS =
      "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bat = {
    enable = true;
    config = { tabs = "8"; };
  };

  imports = [
    ./pkgs/zsh.nix
    ./pkgs/starship.nix
    ./pkgs/git.nix
    ./pkgs/mako.nix
    ./pkgs/firefox.nix
    ./pkgs/alacritty.nix
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "text/plain" = "nvim.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };

}
