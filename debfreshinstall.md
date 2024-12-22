# Getting started  

on a fresh install of debian (make sure the firmware file has been downloaded and added to the firmware folder in the install usb).  
  
```console
su -
wpa_passphrase <ssid> <password> > /etc/wpa_supplicant/wpa_supplicant.conf
wpa_supplicant -B -iwlp6s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -Dwext
dhclient wlp6s0
```
  
This will get us connected to a wifi network.  

Now we should install sudo

```console
apt update
apt install sudo
visudo # edit sudoers file to allow the user to have sudo permissions
```
Now we can exit from root user, since sudo has been installed.

lets update the microcode first

```console
sudo apt-get install intel-microcode
```

Now we need to get i3 setup

```console
sudo apt install xorg i3

# if needed install any other additional packages
sudo apt install i3lock feh dunst scrot # etc
# dunst, suckless-tools, i3lock and such automatically installed with i3
```

next we'll install w3m to download firefox binaries.

```console'
sudo apt install w3m
``` 

using w3m, download the binaries from firefox website and extract it using tar

make sure to make a Downloads folder and put firefox in there. downloads from firefox default to the Downloads folder automatically

```console
mkdir ~/Downloads
tar -xjf firefox-XX-XX.tar.bz2
```

install dependencies of firefox.

```console
sudo apt install packagekit-gtk3-module
# or 
sudo apt install libgtk-3-0

sudo apt install libdbus-glib-1-2

sudo ln -s ~/Downloads/firefox/firefox ~/bin/firefox # create symbolic link in bin so it can be opened via dmenu
```

now lets install a terminal emulator and zsh along with powerline
we are going to use lukesmith's version of st with some patches applied  

```console
sudo apt install build-essential # install the essentials for building like gcc g++ and make
sudo apt install libx11-dev libxft-dev libharfbuzz-dev # needed for compiling st
git clone https://github.com/lukeSmithxyz/st
cd st # make any changes as needed in the config.h file. change font to 12pt
sudo make install
```

now we need to set the default terminal emulator

```console
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 100
sudo update-alternatives --config x-terminal-emulator # and then set st
```

now we need to install zsh and powerline 

```console
sudo apt install zsh
zsh # to run the new user configurator 
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # this will ask to set default shell to zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k # install powerline
```

quit the powerline configuration and download the fonts given in the readme of powerline

now we need to install the powerline fonts

```console
sudo mv Meslo* /usr/local/share/fonts
fc-cache -fv # to rebuild  the fonts cache
```

now we can open another terminal, run zsh and run powerline configurator

```console
p10k configure # use this if it does not start automatically
```
choose the required config and save. 
we also need to manually change the theme in .zshrc to be "powerlevel10k/powerlevel10k". 

now we need to fix sound issues

```console
sudo apt install alsa-utils
sudo apt install pulseaudio
sudo apt install pavucontrol
```

this should fix issues with sound drivers and such. the default configuration of sound and such is left to the volumeset script file to initialize

now we need to download the shcripts repo from my github and link the files as needed profile, zprofile, xinit and such.

```console
# usermod -aG sudo tausif # add the user into sudo group, should execte as root
sudo apt install psmisc
```

and now we can go ahead and restart the pc and see if all these worked.
also remove the borders from windows with i3 config
