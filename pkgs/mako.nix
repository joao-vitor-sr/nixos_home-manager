{ config, pkgs, ... }: {
  services.mako = {
    enable = true;
    font = "Iosevka 10";
    anchor = "bottom-right";
    backgroundColor = "#282a36";
    textColor = "#f8f8f2";
    width = 350;
    margin = "0,20,20";
    padding = "10";
    borderSize = 2;
    borderColor = "#bd93f9";
    borderRadius = 5;
    defaultTimeout = 10000;
    groupBy = "summary";
  };
}
