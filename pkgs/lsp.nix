{ pkgs, ... }: {
  home.packages = with pkgs; [
    texlab
    lua-language-server
    stylua
    rust-analyzer
    nodePackages.intelephense
    nodePackages.typescript-language-server
  ];

}
