# Dotfiles
My personal dotfile collection, managed by [Gnu
Stow](https://www.gnu.org/software/stow/), and inspired by [xero's
dotfiles](https://github.com/xero/dotfiles).

## OS
My operating system is currently Arch linux. Arch is known for its installation
difficulty because it has no graphical installer; everything must be initially
configured from the command line. I wrote up the installation notes at
https://brookskindle.github.io/installing-arch-linux.html, if you are curious.
These notes are mostly for myeslf because I tend to hop around distributions
fairly frequently and I wanted to document the steps taken to install it. I
quite like the simplicity and control that Arch gives its users, and even if I
do switch away from it, I'll probably make my way back to it again at some
point in the future so I might as well make it easier for myself to re-install!

# Mouse support?
https://wiki.archlinux.org/title/Touchpad_Synaptics

go to
```console
$ vim /etc/X11/xorg.conf.d/70-synaptics.conf
```
