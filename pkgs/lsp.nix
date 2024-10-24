{ pkgs, ... }: {
  home.packages = with pkgs; [
    texlab
    lua-language-server
    stylua
    rust-analyzer
    phpactor
    nodePackages.typescript-language-server
    nodePackages.intelephense
    vscode-langservers-extracted
  ];

}
