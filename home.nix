{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.username = "jvsr";
  home.homeDirectory = "/home/jvsr";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    yt-dlp
    swaybg
    emacs
    neofetch
    lxappearance
    lsd
    lutris
    gnome.nautilus
    gnome.adwaita-icon-theme
    obsidian
    spotify
    swww
    ffmpeg
    fzf
    bitwarden
    tealdeer
    qbittorrent
    wofi
    libreoffice
    ripgrep
    flutter
    inkscape-with-extensions
  ];

  home.file = { };

  home.file.".config/gtk-3.0/" = {
    recursive = true;
    source = ./configs/gtk-3.0;
    target = ".config/gtk-3.0";
  };

  home.file.".config/hypr/" = {
    recursive = true;
    source = ./configs/hypr;
    target = ".config/hypr";
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
    PATH = "$HOME/.npm-global:$HOME/.local/bin:$(yarn global bin):$PATH";
    TERMINAL = "foot";
    BROWSER = "vivaldi";
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

    GTK_THEME="Gruvbox:dark";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./pkgs/zsh.nix
    ./pkgs/git.nix
    ./pkgs/mako.nix
    ./pkgs/firefox.nix
    ./pkgs/waybar.nix
    ./pkgs/zathura.nix
    ./pkgs/wofi.nix
    ./pkgs/lsp.nix
    ./pkgs/foot.nix
    ./pkgs/newsboat.nix
    ./pkgs/tmux.nix
    ./pkgs/bat.nix
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "text/plain" = "emacs.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
    };
  };

}
