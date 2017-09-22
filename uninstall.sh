#!/bin/bash

if [[ $EUID -ne 0 ]]; then 
    echo "Please run as root"
    exit 1
fi

rm usr/bin/gnome3-launcher
rm usr/bin/i3-launcher
rm usr/share/applications/i3-launcher.desktop
rm usr/share/gnome-session/sessions/gnome3-plus-i3.session
rm usr/share/xsessions/gnome3-plus-i3.desktop
