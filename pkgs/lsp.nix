{ pkgs, ... }:
{
  home.packages = with pkgs; [
    texlab
    lua-language-server
    stylua
  ];
  
}
