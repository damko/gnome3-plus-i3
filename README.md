# i3-gnome3

## About

Installing this repo will enable Gnome3 session for your i3 windows manager.

Repository's files come from [Alice's repository](https://github.com/aliceriot/i3-gnome). 
I tested and adjusted them a little for a fresh Debian Testing installation.

Basically right after installing your fresh Debian, install these packages:

	apt-get install i3 i3-wm i3blocks i3lock i3status

Then follow the instructions for installing this repository and you are good to go with your i3 wm

Repository creation date: @2017-07-05

## Install

Installing this files will just copy a few files in your filesystem therefore it's idempotent. It requires root.

1. clone this repo
1. cd repo
1. run `sudo ./install.sh`
1. restart gdm3

By clicking on the gdm3 "gear icon" you should see i3-gnome3. Select it and log in.

## Uninstall

Unistalling this repo will leave your filesystem clean. It requires root.

1. cd repo
1. run `sudo ./uninstall.sh`
1. restart gdm3
