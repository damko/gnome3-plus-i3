# Gnome3 plus i3

## About

By installing this repo your system will be able to load Gnome3 session through [GnomeFallback](https://wiki.gnome.org/Projects/GnomeFlashback) and then the [i3 window manager](https://i3wm.org/).

This configuration is running on Debian Testing. I use it daily.

This is a screenshot of my "L shaped monitor configuration" 

![Imgur](https://i.imgur.com/4sAOjwj.png)

## Install this repo

Be sure to have these packages installed

	apt-get install i3 i3-wm i3blocks i3lock i3status suckless-tools gnome-flashback gnome-flashback-common

Then install this repo: this will just copy a few files in your filesystem and, therefore, it's an idempotent installation. It requires root.

1. clone this repo
1. cd repo
1. run `sudo ./install.sh`


## Configure your system

You now need to edit your `~/.config/i3/config` file and look for "exits i3": arrange the lines as follow:

	# exits i3 (logs you out of your X session)
	# bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
	bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Do you really want to exit i3?' -b 'Yes, exit i3' 'gnome-session-quit --force --logout'"


## Load Gnome3 with i3

You are good to go. Restart X

	sudo pkill -9 X

When the GDM3 screen appears click on the "gear icon" and you should see **"gnome3 plus i3"**. Select it and log in.

## Test Gnome session

To test if the gnome-session has been loaded correctly you can run these tests:

	echo $GDMSESSION

> gnome3-plus-i3

	echo $DESKTOP_AUTOSTART_ID

> 108e796b5eb23a2777150601919829285800000156950002

and 
	ps aux | grep gnome-session

... you should see a few instances


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

## Troubleshooting

If the gnome session is not starting and, therefore, you are not able to login in your gnome-i3 environment, check you `/var/log/syslog`

If you see something like

> gnome-session-binary Unable to find required component 'org.gnome.SettingsDaemon.xxxxx'

most likely you are missing some gnome package. Be sure to have the nautilus package installed.

In my debian testing, every once in a while, after a "dist-upgrade" my gnome-i3 doesn't work anymore but so far it has always been due to some missing package.
I'm leaving my "gnome-something" packages list in the `gnome_packages_list.txt` file


## Uninstall

Unistalling this repo will leave your filesystem clean. It requires root.

1. cd repo
1. run `sudo ./uninstall.sh`
1. sudo pkill -9 X

## More

Now that you are here you might be interested also in this [my other repo](https://github.com/damko/i3-config)
