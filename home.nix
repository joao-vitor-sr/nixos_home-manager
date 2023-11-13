{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.username = "jvsr";
  home.homeDirectory = "/home/jvsr";

  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    swaybg
    neofetch
    lxappearance
    lsd
    lutris
    obsidian
    spotify
    swww
    ffmpeg
    fzf
    bitwarden
    tealdeer
    qbittorrent
    wofi
    webcord
    libreoffice
    ripgrep
  ];

  home.file = { };

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
    EDITOR = "lvim";
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
    config = {
      tabs = "8";
      theme = "Dracula";
    };
  };

  imports = [
    ./pkgs/zsh.nix
    ./pkgs/starship.nix
    ./pkgs/git.nix
    ./pkgs/mako.nix
    ./pkgs/firefox.nix
    ./pkgs/waybar.nix
    ./pkgs/zathura.nix
    ./pkgs/wofi.nix
    ./pkgs/lsp.nix
    ./pkgs/foot.nix
    ./pkgs/newsboat.nix
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
