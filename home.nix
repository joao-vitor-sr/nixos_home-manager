{ config, pkgs, ... }:

{
  home.username = "jvsr";
  home.homeDirectory = "/home/jvsr";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    zathura
    bitwarden
    tealdeer
    firefox
    qbittorrent
    obsidian
    discord
    spotify
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    PATH = "$HOME/.local/bin:$(yarn global bin):$PATH";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    LIBSEAT_BACKEND = "logind";
    NIXPKGS_ALLOW_BROKEN = "1";
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

  include = [ pkgs/zsh.nix ];

}
