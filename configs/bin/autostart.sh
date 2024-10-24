!#/usr/bin/env bash

# 
kmonad ~/.config/kmonad/kmonad.kbd &
mako &
wl-clipboard-history -t &
~/.config/hypr/xdg-portal-hyprland &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
swww init &
setbg 
