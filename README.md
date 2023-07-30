# automate
AutomateVM

# install
apt-get install -y xorg openbox tint2 firefox-esr vim-nox rungetty unattended-upgrades xterm wmctrl ifstat xautomation imagemagick psmisc expect fdupes pdftohtml apache2 php

nano /etc/systemd/system/getty.target.wants/getty\@tty1.service
nano /etc/xdg/openbox/autostart

wget http://snapshot.debian.org/archive/debian/20161207T212358Z/pool/main/t/task-spooler/task-spooler_1.0-1_amd64.deb

dpkg -i task-spooler_1.0-1_amd64.deb

### prospektKaufland
You need to put there a website according to your store:

echo "https://filiale.kaufland.de/service/filiale/berlin-mitte-8920.html" >> prospektKaufland/website.txt
### prospektLidl
You need to put there a website according to your store:

echo "https://www.lidl.de/c/online-prospekte/s10005610?ar=1" >> prospektLidl/website.txt
### websiteChanged
You need to put there a list of websites, example:

echo "https://www.google.com" >> websiteChanged/websites.txt

echo "https://www.wikipedia.com" >> websiteChanged/websites.txt
