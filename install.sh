#!/bin/bash

replace() {
    src=$1
    dest=$2
    if [[ -f $dest/$src ]]; then
        rm $dest/$src
        cp $src $dest
    else
        cp $src $dest/
    fi
}

replace i3-gnome3 /usr/bin
replace i3-gnome3.desktop /usr/share/applications
replace i3-gnome3.desktop /usr/share/xsessions
replace i3-gnome3.session /usr/share/gnome-session/sessions
