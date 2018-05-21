# Arch linux!
I'm taking the plunge and installing Arch linux. As expected, not everything is
working out of the box, so this will document some of the things I've had to do
to customize my machine.

> Side note: I found this helpful image on getting arch up and running
![](https://i.imgur.com/Hokk8sK.jpg)

## internet
I don't get an IP by default, so starting the `dhcpcd` daemon is required.
```
# permanently, for network interface enp3s0
sudo systemctl enable dhcpcd@enp3s0.service
sudo systemctl start dhcpcd@enp3s0.service
```

## X
X isn't installed by default, so we've got to install it, along with a display
and window manager
```
pacman -S xorg-server xorg-init
pacman -S lightdm-gtk-greeter
systemctl enable lightdm.service
pacman -S i3-gaps
pacman -S i3lock scrot imagemagick  # required for my lock.sh script
```

## sound
```
pacman -S pulseaudio pulseaudio-alsa
pacman -S alsa-utils  # gives cli volume programs (amixer and alsamixer)
pacman -S pavucontrol  # gives gui volume control, pavucontrol
```
After a reboot, sound worked

## arch user repository
I know there are AUR helper programs out there like `yaourt` and `pacaur`, but
for now I'm going to learn how to build them by hand, as suggested in the [arch
user repository
wiki](https://wiki.archlinux.org/index.php/Arch_User_Repository)

Edited `/etc/makepkg.conf` to specify the number of jobs that `makepkg` should
use when running `make`. Good explanation on why at
https://stackoverflow.com/a/15295032

## games
### minecraft
available via the AUR, but it only works if jre8 is installed. 9 and 10 don't
work.

### steam
https://wiki.archlinux.org/index.php/steam has more information, but tl;dr of
what I had to do:
* multilib repository has to be enabled in `/etc/pacman.conf`
* 32 bit graphics drivers need to be installed
* ttf-liberation fonts must be installed. I could have chosen to go the route
  of getting Microsoft fonts, but it sounded like too much hassle for what it's
  worth.
