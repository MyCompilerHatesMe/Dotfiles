#!/bin/bash

WALLPAPER_DIR="$HOME/wallpapers"
WOFI_CONF="$HOME/.config/wofi/wallpaper"
WOFI_STYLE="$HOME/.config/wofi/style-wallpaper.css"


get_monitors() {
    echo "All"
    hyprctl monitors | grep "Monitor" | awk '{print $2}'
}

menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}

main() {
    choice=$(menu | wofi -c "${WOFI_CONF}" -s "${WOFI_STYLE}" --show dmenu --prompt "Select Wallpaper:" -n)
    
    if [ -z "$choice" ]; then
        exit 0
    fi

    selected_wallpaper=$(echo "$choice" | sed 's/^img://')

    monitor=$(get_monitors | wofi -c "${WOFI_CONF}" -s "${WOFI_STYLE}" --show dmenu --prompt "Select Monitor:" -n)

    if [ -z "$monitor" ]; then
        exit 0
    fi

    if [ "$monitor" = "All" ]; then
        swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
    else
        swww img -o "$monitor" "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
    fi

    wal -i "$selected_wallpaper" -n --cols16

    pkill -SIGUSR2 waybar
    
    swaync-client --reload-css

    cat ~/.cache/wal/colors-kitty.conf > ~/.config/kitty/current-theme.conf
    pkill -SIGUSR1 kitty

    source ~/.cache/wal/colors.sh && cp -r "$wallpaper" ~/wallpapers/pywallpaper.jpg 
    sudo "$HOME/.config/hypr/scripts/update_sddm_bg.sh" "$selected_wallpaper"
}

main
