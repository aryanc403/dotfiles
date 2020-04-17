sudo dpkg -i pkg/playerctl-0.6.1_amd64.deb
sudo apt-get install feh
cd ~/github/
git clone git@github.com:aryanc403/WallPapers.git
#sudo apt-get install arandr
mkdir ~/.fonts/
cd dotfiles/i3/pkg/
cp -r fontawesome-free-5.2.0-desktop/otfs/* ~/.fonts/
gsettings set org.gnome.desktop.background show-desktop-icons false
cp -r YosemiteSanFranciscoFont-master/*.ttf ~/.fonts/
sudo apt-get install lxappearance
sudo apt install autoconf
sudo apt-get install libgtk-3-dev
./autogen.sh --prefix=/usr
sudo make install
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt-get install moka-icon-theme faba-icon-theme faba-mono-icons
sudo apt install pixmap
sudo apt-get install gtk2-engines-pixbuf
sudo apt install gnome-themes-standard
sudo apt-get install lxappearance gtk-chtheme qt4-qtconfig
sudo apt install compton
sudo apt install i3blocks
sudo apt install scrot
sudo apt install rofi

cd ~
mkdir ~/Pictures/Screenshots

#Correct system fonts Part3 7:50
#Install Arc Theme
#open lxappearance and select Arc Dark theme and moka icon pack.


