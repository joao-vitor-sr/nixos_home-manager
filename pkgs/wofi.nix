{ ... }: 
{
  programs.wofi = {
    enable = true;
    style = builtins.readFile ./colors/wofi/gruvbox;
  };
}
