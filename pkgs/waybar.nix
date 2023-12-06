{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        layer = "top";
        height = 30;
        modules-left =
          [ "custom/launcher" "hyprland/workspaces" "custom/playerlabel" ];
        modules-center = [ "cpu" "memory" ];
        modules-right = [ "tray" "network" "pulseaudio" "clock" ];

        "custom/launcher" = { format = "󰈸"; };
        "hyprland/workspaces" = {
          all-outputs = true;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace -1";
          on-scroll-down = "hyprctl dispatch workspace +1";
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = "";
            active = "";
            default = "󰧞";
            sort-by-number = true;
          };
        };
        "custom/playerlabel" = {
          format = "<span>{}</span>";
          return-type = "json";
          max-length = 48;
          exec = ''
            playerctl -a metadata --format '{"text": "{{artist}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';

          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
        };

        "cpu" = {
          format = "󰻠 {usage}%";
          format-alt = "󰻠 {avg_frequency} GHz";
          interval = 5;
        };

        "memory" = {
          format = "󰍛 {}%";
          format-alt = "󰍛 {used}/{total} GiB";
          interval = 5;
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
          format = " {:%H:%M}";
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
