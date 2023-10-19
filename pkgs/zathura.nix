{ config, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    options = {
      window-title-basename = "true";
      selection-clipboard = "clipboard";

      default-bg = "#282a36";
      default-fg = "#f8f8f2";

      notification-error-bg = "#ff5555";
      notification-error-fg = "#f8f8f2";
      notification-warning-bg = "#ffb86c";
      notification-warning-fg = "#44475a";
      notification-bg = "#282a36";
      notification-fg = "#f8f8f2";

      completion-bg = "#282a36";
      completion-fg = "#6272a4";
      completion-group-bg = "#282a36";
      completion-group-fg = "#6272a4";
      completion-highlight-bg = "#44475a";
      completion-highlight-fg = "#f8f8f2";

      index-bg = "#282a36";
      index-fg = "#f8f8f2";
      index-active-bg = "#44475a";
      index-active-fg = "#f8f8f2";

      inputbar-bg = "#282a36";
      inputbar-fg = "#f8f8f2";
      statusbar-bg = "#282a36";
      statusbar-fg = "#f8f8f2";

      highlight-color = "#ffb86c";
      highlight-active-color = "#ff79c6";

      render-loading = true;
      render-loading-fg = "#282a36";
      render-loading-bg = "#f8f8f2";

      recolor-lightcolor = "#282a36";
      recolor-darkcolor = "#f8f8f2";

      adjust-open = "width";
      recolor = true;

    };
  };
}
