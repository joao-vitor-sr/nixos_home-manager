{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    shortcut = "a";
    terminal = "foot";
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
      tmuxPlugins.dracula
      tmuxPlugins.better-mouse-mode
    ];
    extraConfig = ''
            set -g mouse on
            set-option -sa terminal-overrides ",xterm*:Tc"

            set -g @dracula-show-battery false
            set -g @dracula-show-powerline true
            set -g @dracula-refresh-rate 10
            
            set-window-option -g mode-keys vi
            bind -T copy-mode-vi v send-keys -X begin-selection
            bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'

            # Shift Alt vim keys to switch windows
            bind -n M-H previous-window
            bind -n M-L next-window

            # Vim style pane selection
            bind h select-pane -L
            bind j select-pane -D 
            bind k select-pane -U
            bind l select-pane -R

            # set vi-mode
            set-window-option -g mode-keys vi

            bind '"' split-window -v -c "#{pane_current_path}"
            bind % split-window -h -c "#{pane_current_path}"

            # forget the find window.  That is for chumps
            bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"
    '';
  };
}
