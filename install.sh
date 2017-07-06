#!/bin/bash

# This script installs .desktop and .session files in order to provide gnome3-session with i3
# by @damko

# This is the most important file
# GDM parses the /usr/share/xsessions/ directory to find which are the available sessions
# and presents them to the user (visible when you click the gear icon)
cp -f usr/share/xsessions/i3-gnome3.desktop /usr/share/xsessions/

# This is the script loaded by i3-gnome3.desktop
# This script is the right place to do stuff before i3 is loaded
cp -f usr/bin/i3-gnome3 /usr/bin/

# This session file tells gnome-session which components to load
cp -f usr/share/gnome-session/sessions/i3.session /usr/share/gnome-session/sessions/

# This is not very relevant but I added it to follow the schema of the i3 package
# Everything works even without this file
cp -f usr/share/applications/i3-gnome3.desktop /usr/share/applications/

