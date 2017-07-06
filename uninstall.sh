#!/bin/bash

# This script uninstalls .desktop and .session files used to provide gnome3-session with i3
# by @damko

rm /usr/share/xsessions/i3-gnome3.desktop
rm /usr/bin/i3-gnome3
rm /usr/share/gnome-session/sessions/i3.session
rm /usr/share/applications/i3-gnome3.desktop

