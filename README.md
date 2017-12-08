# Dotfiles
My personal dotfile collection, managed by [Gnu
Stow](https://www.gnu.org/software/stow/).

## Who's it for?
Well, mostly me. I mean, they are *my* personal dotfiles after all. Anybody
else is welcome to try them out, however.

# Software
This is a rather incomplete list of software required to fully make use of
these dotfiles. I'm not apologizing for that, sorry.

### Software development
* git
* tig
* [fzf](https://github.com/junegunn/fzf)
* ipdb
* stow
* tmux
* powerline
* terminator
* vim
* jq
* virtualenvwrapper
* curl
* python-pip
* python3-pip

### Window manager
* [i3](https://i3wm.org)
* [i3blocks](https://github.com/vivien/i3blocks)
* imagemagick
* fonts-font-awesome
* feh
* scrot
* acpi
* [rofi](https://davedavenport.github.io/rofi/)

#### Lock Screen
By default, Xubuntu uses `xflock4` as its default lock screen manager. I prefer
my own lock screen script. I copy it to `/usr/local/bin/xflock4` so that my
lock screen script is used in place of the actual `xflock4` program. Solution
taken from [here](https://ubuntuforums.org/showthread.php?t=1107843).

### Media
* mpd
* sonata/ncmpcpp

## Styling Advice
### Themes and Icons
Here's what my desktop environment currently looks like
![dotfiles-busy](https://user-images.githubusercontent.com/2654835/33787926-54ba0606-dc24-11e7-9283-d0ba168160a3.png)
* I'm using the [Dracula Theme](https://github.com/dracula/dracula-theme) color
  palette in a lot of my configs
* I'm using
  [Arc-Flatabulous](https://github.com/andreisergiu98/arc-flatabulous-theme)
  for my gtk theme
* I'm using [Flatabulous](https://github.com/anmoljagetia/Flatabulous) for the
  icons

### Bootloader
The plymouth bootloader is the default bootloader for Xubuntu. I chose to
modify the background of the loading screen, but you can also change the
loading text as well.

1. Modify files to your heart's content in
   `/usr/share/plymouth/themes/xubuntu-logo/`
1. Run `sudo update-initramfs -u` to make the changes permanent

### Login Screen
I've edited my login screen wallpaper, but there are a few other things you can
tweak as well. You can either directly edit
`/etc/lightdm/lightdm-gtk-greeter.conf` or you can run
`lightdm-gtk-greeter-settings` to edit it graphically.
This [stack overflow answer](https://askubuntu.com/a/868899) can help.

### Window Manager
A [neat
trick](https://www.reddit.com/r/unixporn/comments/5dq79a/how_to_create_a_pallet_from_your_wallpaper/)
I found on reddit to help style colors based on your wallpaper. To generate
colors similar to your wallpaper:

1. Load wallpaper into gimp
1. Select `image->mode->indexed`, then generate
1. Open windows->dockable dialogs->colormap

Alternatively, use `gpick` and generate the same thing under
`Tools->Palette from image`
