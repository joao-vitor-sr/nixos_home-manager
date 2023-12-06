{ ... }: {
  services.mako = {
    enable = true;
    font = "Iosevka 10";
    anchor = "bottom-right";
    backgroundColor = "#282828";
    textColor = "#ebdbb2";
    width = 350;
    margin = "0,20,20";
    padding = "10";
    borderSize = 2;
    borderColor = "#98971a";
    borderRadius = 5;
    defaultTimeout = 10000;
    groupBy = "summary";
  };
}
