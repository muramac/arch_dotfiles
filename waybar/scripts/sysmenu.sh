#!/bin/bash

# ==============================================================================
# Wofi UI Functions (без темы, можно добавить CSS через --style)
# ==============================================================================
show_menu() {
  echo -e "$1" | wofi --dmenu -i -p "$2"
}

# ==============================================================================
# Menu Variables
# ==============================================================================
menu_main="󰀻  Apps\n󰏓  Packages\n󱐋  Power Profiles\n󰐥  Power"
menu_packages="󰏓  Native Apps (pacseek)\n󰖟  PWAs (Web Apps)"
menu_pwa="󰐕  Create New PWA\n󰆴  Delete PWA"
menu_power_profile="󰓅  Performance\n󰾅  Balanced\n󰾆  Efficient"
menu_power="󰒲  Suspend\n󰑓  Reboot\n󰍃  Log Out\n󰐥  Power Off"

# ==============================================================================
# Logic Tree
# ==============================================================================
if [[ "$1" == "--power" ]]; then
  chosen_main="у°ђҐ  Power"
else
  chosen_main=$(show_menu "$menu_main" "System")
fi

case "$chosen_main" in
*"Apps")
  wofi --show drun
  ;;

*"Packages")
  chosen_pkg=$(show_menu "$menu_packages" "Packages")
  case "$chosen_pkg" in
  *"Native Apps"*)
    kitty --title "sysmenu-tui" -e pacseek
    ;;
  *"PWAs"*)
    chosen_pwa_act=$(show_menu "$menu_pwa" "PWAs")
    case "$chosen_pwa_act" in
    *"Create"*)
      kitty --title "sysmenu-tui" -e "$HOME/.config/waybar/scripts/pwa-builder.sh"
      ;;
    *"Delete"*)
      kitty --title "sysmenu-tui" -e yazi "$HOME/.local/share/applications/"
      ;;
    esac
    ;;
  esac
  ;;

*"Power Profiles")
  current_prof=$(powerprofilesctl get)

  p_text="Performance"
  b_text="Balanced"
  e_text="Efficient"

  [[ "$current_prof" == "performance" ]] && p_text="<i>у°“…  Performance *</i>" || p_text="у°“…  Performance"
  [[ "$current_prof" == "balanced" ]] && b_text="<i>у°ѕ…  Balanced *</i>" || b_text="у°ѕ…  Balanced"
  [[ "$current_prof" == "power-saver" ]] && e_text="<i>у°ѕ†  Efficient *</i>" || e_text="у°ѕ†  Efficient"

  menu_power_profile="${p_text}\n${b_text}\n${e_text}"

  chosen_prof=$(echo -e "$menu_power_profile" | wofi --dmenu -i -p "Profile" -m)

  case "$chosen_prof" in
  *"Performance"*) powerprofilesctl set performance ;;
  *"Balanced"*) powerprofilesctl set balanced ;;
  *"Efficient"*) powerprofilesctl set power-saver ;;
  esac
  ;;

*"Power")
  chosen_power=$(show_menu "$menu_power" "Power")
  case "$chosen_power" in
  *"Suspend"*)
    hyprlock &
    sleep 0.5
    systemctl suspend
    ;;
  *"Reboot"*) systemctl reboot ;;
  *"Log Out"*)
    if command -v hyprshutdown >/dev/null 2>&1 && [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
      hyprshutdown
    elif [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]]; then
      hyprctl dispatch exit
    else
      niri msg action quit
    fi
    ;;
  *"Power Off"*) systemctl poweroff ;;
  esac
  ;;
esac