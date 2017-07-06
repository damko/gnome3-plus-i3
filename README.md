# i3-gnome3

## About

Installing this repo will load i3 with Gnome3 session.

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
1. update your .config/i3/config file as described below
1. sudo pkill -9 X #restart X and GDM3

By clicking on the gdm3 "gear icon" you should see i3-gnome3. Select it and log in.

## i3 config file updates

Before reloading gdm3 you should parse, check and update your `~/.config/i3/config file accordingly with the following lines:

	# This exits i3 (logs you out of your X session)
	bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'gnome-session-quit --force --logout'"

	# This loads and lock the screensaver
	bindsym $mod+Shift+l exec "gnome-screensaver-command -l"


	# Takes a screenshot of the whole screen
	bindsym Print exec gnome-screenshot

	# Takes a screenshot of the focused window
	bindsym Shift+Print exec gnome-screenshot -w

	# Loads gnome stuff at i3 startup
	exec_always gnome-settings-daemon &
	exec_always gnome-screensaver &
	exec_always --no-startup-id tracker daemon -t all
	exec_always --no-startup-id tracker daemon -s

## Test Gnome session

To test if the gnome-session has been loaded correctly you can run these tests:

	echo $GDMSESSION
	i3-gnome3

and 
	ps aux | grep gnome-session
	/usr/lib/gnome-session/gnome-session-binary --session=i3

Additionally you can run some other tests if you install some additional packages:

	sudo apt-get install wmctrl

	wmctrl -m
	Name: i3
	Class: N/A
	PID: N/A
	Window manager's "showing the desktop" mode: N/A

or

	sudo apt-get install libnotify-bin

	notify-send "this is a bubble message"


In this last case you should see a notification message (a bubble on the top right of your screen) showing "this is a bubble message)

## Uninstall

Unistalling this repo will leave your filesystem clean. It requires root.

1. cd repo
1. run `sudo ./uninstall.sh`
1. sudo pkill -9 X #restart X and GDM3
