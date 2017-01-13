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

### Media
* mpd
* sonata/ncmpcpp

## Styling Advice
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
