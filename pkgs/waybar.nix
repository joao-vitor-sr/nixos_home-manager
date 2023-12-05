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
    style = ''
      * {
          border: none;
          border-radius: 0px;
          /*font-family: VictorMono, Iosevka Nerd Font, Noto Sans CJK;*/
          font-family: Iosevka, FontAwesome, Noto Sans CJK;
          font-size: 14px;
          font-style: normal;
          min-height: 0;
      }

      window#waybar {
          background: rgba(31, 31, 40, 0.5);
          border-bottom: 1px solid #1f1f28;
          color: #dcd7ba
      }

      #workspaces {
      	background: #1f1f28;
      	margin: 5px 5px 5px 5px;
        padding: 0px 5px 0px 5px;
      	border-radius: 16px;
        border: solid 0px #dcd7ba;
        font-weight: normal;
        font-style: normal;
      }
      #workspaces button {
          padding: 0px 5px;
          border-radius: 16px;
          color: #928374;
      }

      #workspaces button.active {
          color: #dcd7ba;
          background-color: transparent;
          border-radius: 16px;
      }

      #workspaces button:hover {
      	background-color: #E6B9C6;
      	color: black;
      	border-radius: 16px;
      }

      #custom-date, #clock, #battery, #pulseaudio, #network, #custom-randwall, #custom-launcher {
      	background: transparent;
      	padding: 5px 5px 5px 5px;
      	margin: 5px 5px 5px 5px;
        border-radius: 8px;
        border: solid 0px #dcd7ba;
      }

      #custom-date {
      	color: #D3869B;
      }

      #custom-power {
      	color: #7e9cd8;
      	background-color: #1f1f28;
      	border-radius: 5px;
      	margin-right: 10px;
      	margin-top: 5px;
      	margin-bottom: 5px;
      	margin-left: 0px;
      	padding: 5px 10px;
      }

      #tray {
          background: #1f1f28;
          margin: 5px 5px 5px 5px;
          border-radius: 16px;
          padding: 0px 5px;
          /*border-right: solid 1px #282738;*/
      }

      #clock {
          color: #c8c093;
          background-color: #1f1f28;
          border-radius: 0px 0px 0px 24px;
          padding-left: 13px;
          padding-right: 15px;
          margin-right: 0px;
          margin-left: 10px;
          margin-top: 0px;
          margin-bottom: 0px;
          font-weight: bold;
          /*border-left: solid 1px #282738;*/
      }


      #battery {
          color: #9ece6a;
      }

      #battery.charging {
          color: #9ece6a;
      }

      #battery.warning:not(.charging) {
          background-color: #f7768e;
          color: #24283b;
          border-radius: 5px 5px 5px 5px;
      }

      #backlight {
          background-color: #24283b;
          color: #db4b4b;
          border-radius: 0px 0px 0px 0px;
          margin: 5px;
          margin-left: 0px;
          margin-right: 0px;
          padding: 0px 0px;
      }

      #network {
          color: #dcd7ba;
          border-radius: 8px;
          margin-right: 5px;
      }

      #pulseaudio {
          color: #dcd7ba;
          border-radius: 8px;
          margin-left: 0px;
      }

      #pulseaudio.muted {
          background: transparent;
          color: #928374;
          border-radius: 8px;
          margin-left: 0px;
      }

      #custom-randwall {
          color: #dcd7ba;
          border-radius: 8px;
          margin-right: 0px;
      }

      #custom-launcher {
          color: #c8c093;
          background-color: #1f1f28;
          border-radius: 0px 24px 0px 0px;
          margin: 0px 0px 0px 0px;
          padding: 0 20px 0 13px;
          /*border-right: solid 1px #282738;*/
          font-size: 20px;
      }

      #custom-launcher button:hover {
          background-color: #FB4934;
          color: transparent;
          border-radius: 8px;
          margin-right: -5px;
          margin-left: 10px;
      }

      #custom-playerctl {
      	background: #1f1f28;
      	padding-left: 15px;
        padding-right: 14px;
      	border-radius: 16px;
        /*border-left: solid 1px #282738;*/
        /*border-right: solid 1px #282738;*/
        margin-top: 5px;
        margin-bottom: 5px;
        margin-left: 0px;
        font-weight: normal;
        font-style: normal;
        font-size: 16px;
      }

      #custom-playerlabel {
          background: transparent;
          padding-left: 10px;
          padding-right: 15px;
          border-radius: 16px;
          /*border-left: solid 1px #282738;*/
          /*border-right: solid 1px #282738;*/
          margin-top: 5px;
          margin-bottom: 5px;
          font-weight: normal;
          font-style: normal;
      }

      #window {
          background: #1f1f28;
          padding-left: 15px;
          padding-right: 15px;
          border-radius: 16px;
          /*border-left: solid 1px #282738;*/
          /*border-right: solid 1px #282738;*/
          margin-top: 5px;
          margin-bottom: 5px;
          font-weight: normal;
          font-style: normal;
      }

      #custom-wf-recorder {
          padding: 0 20px;
          color: #e5809e;
          background-color: #1E1E2E;
      }

      #cpu {
          background-color: #1f1f28;
          /*color: #FABD2D;*/
          border-radius: 16px;
          margin: 5px;
          margin-left: 5px;
          margin-right: 5px;
          padding: 0px 10px 0px 10px;
          font-weight: bold;
      }

      #memory {
          background-color: #1f1f28;
          /*color: #83A598;*/
          border-radius: 16px;
          margin: 5px;
          margin-left: 5px;
          margin-right: 5px;
          padding: 0px 10px 0px 10px;
          font-weight: bold;
      }

      #disk {
          background-color: #1f1f28;
          /*color: #8EC07C;*/
          border-radius: 16px;
          margin: 5px;
          margin-left: 5px;
          margin-right: 5px;
          padding: 0px 10px 0px 10px;
          font-weight: bold;
      }

      #custom-hyprpicker {
          background-color: #1f1f28;
          /*color: #8EC07C;*/
          border-radius: 16px;
          margin: 5px;
          margin-left: 5px;
          margin-right: 5px;
          padding: 0px 11px 0px 9px;
          font-weight: bold;
      }
    '';
  };
}
