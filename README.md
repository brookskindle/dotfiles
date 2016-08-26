# Dotfiles
My personal dotfile collection, managed by [Ansible](https://www.ansible.com).

## Why Ansible?
I was originally inspired by [xero's
dotfiles](https://github.com/xero/dotfiles) to use [GNU
Stow](https://www.gnu.org/software/stow) as a way of managing my dotfiles, but
it lacks the ability to install software or do any other configuration besides
symlinking your files. Performing a fresh install of the operating system is
something I often do, and I was getting tired of having to manually install the
necessary software. Enter Ansible.

(plus, I wanted to learn how to use Ansible and thought this would be a good
opportunity for me to do so)

## Who's it for?
Well, mostly me. I mean, they are *my* personal dotfiles after all. Anybody
else is welcome to try them out, however.

## Pre-installation
Only two programs are required for installation:
* git
* ansible >= 2.0

On an Ubuntu based system, you can install via:
```
sudo apt-get -y install ansible git
```

## Installation
Lucky for you, I recently switched to using a virtual machine for my linux
development work, which means that you can try it out without affecting your
current install. I'm currently using the desktop version of Lubuntu 16.04.

To install, open up a terminal of your choice and enter

```
git clone https://github.com/brookskindle/dotfiles.git ~/dotfiles
cd ~/dotfiles
ansible-playbook main.yml -i inventory.ini --ask-become-pass
```

This will take some time, depending on the speed of your computer and internet.
