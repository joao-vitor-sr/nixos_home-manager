{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        layer = "top";
        height = 0;
        mod = "dock";
        modules-left = [ "clock" "custom/weather" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" ];

        "hyprland/window" = { format = "{}"; };

        "hyprland/workspaces" = {
          all-outputs = true;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            urgent = "";
            active = "";
            default = "";
          };
        };

        "tray" = {
          icon-size = 16;
          spacing = 5;
        };

        "network" = {
          format-wifi = "󰤨";
          format-ethernet = "󰈁";
          format-linked = "󰈂 {ifname} (No IP)";
          format-disconnected = "󰤭";
          format-alt = "󰈁 {ifname}: {ipaddr}/{cidr}";
          tooltip-format = "{essid}";
          on-click-right = "nm-connection-editor";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = { default = [ "󰕿" "󰖀" "󰕾" ]; };
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          on-click-right = "pavucontrol";
        };

        "clock" = {
          format = "{:%H:%M}";
          tooltip = "true";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = " {:%d/%m}";
        };
      };
    };
    style = builtins.readFile ./colors/waybar/gruvbox;
  };
}
