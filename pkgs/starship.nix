{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true; 
    enableZshIntegration = true;
    settings = {
      style = "default";
      add_newline = true;
      scan_timeout = 30;
      keymap = "default";
      disabled = false;
    };
  };
}
