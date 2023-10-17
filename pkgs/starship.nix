{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true; 
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      scan_timeout = 30;
    };
  };
}
