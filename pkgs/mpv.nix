{ ... }: {
  programs.mpv = {
    enable = true;
    bindings = {
      WHEEL_UP = "seek 10";
      WHEEL_DOWN = "seek -10";
    };
  };
}
