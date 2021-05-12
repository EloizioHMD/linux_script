#!/bin/bash

# Pop_OS 20.04

# upgrade 
sudo apt update && sudo apt upgrade -y && sudo apt autoremove

# git
sudo add-apt-repository ppa:git-core/ppa && 
sudo apt update &&
sudo apt install -y git

# tweeks and extensions
# sudo apt install -y gnome-tweaks &&
# sudo apt install -y gnome-shell-extensions &&
# sudo apt install -y chrome-gnome-shell &&
# sudo apt install -y x11-utils &&
# sudo apt install -y gnome-shell-pomodoro &&
sudo apt install -y gir1.2-gtop-2.0 lm-sensors gnome-shell-extension-prefs &&
mkdir -p ~/.local/share/gnome-shell/extensions &&
git clone https://github.com/corecoding/Vitals.git ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com
git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
# git clone https://github.com/kgshank/gse-sound-output-device-chooser.git ~/.local/share/gnome-shell/extensions/gse-sound-output-device-chooser/sound-output-device-chooser@kgshank.net
# after: press Alt + F2 and enter r in the box

# gparted
# sudo apt install -y gparted

# screenfetch
sudo apt install -y neofetch

# htop
sudo apt install -y htop

# audacity
sudo apt install -y audacity

# flameshot
sudo apt install -y flameshot

# fonts
sudo apt install -y ubuntu-restricted-extras ttf-mscorefonts-installer

# obs studio
sudo apt-get install -y ffmpeg &&
sudo add-apt-repository ppa:obsproject/obs-studio &&
sudo apt-get update && 
sudo apt-get install -y obs-studio

# peek
sudo apt install -y peek

# java
sudo apt install -y default-jre default-jdk

# r
# https://rtask.thinkr.fr/installation-of-r-4-0-on-ubuntu-20-04-lts-and-tips-for-spatial-packages/
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 &&
gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9 &&
gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add - &&
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" &&
sudo apt update &&
sudo apt install -y r-base r-base-core r-recommended r-base-dev # r

sudo apt install -y gdal-bin &&
sudo apt install -y libgdal-dev && 
sudo apt install -y libproj-dev && 
sudo apt install -y libssl-dev && 
sudo apt install -y libavfilter-dev &&
sudo apt install -y xml2 && 
sudo apt install -y libxml2-dev && 
sudo apt install -y libgeos-dev && 
sudo apt install -y libudunits2-dev && 
sudo apt install -y gfortran-7 && 
sudo apt install -y gcc-7 g++-7 && 
sudo apt install -y libxml2-dev && 
sudo apt install -y libssl-dev && 
sudo apt install -y libcurl4-openssl-dev && 
sudo apt install -y libv8-dev && 
sudo apt install -y libprotobuf-dev && 
sudo apt install -y libjq-dev && 
sudo apt install -y protobuf-compiler && 
sudo apt install -y libgmp3-dev && 
sudo apt install -y libgtk2.0-dev && 
sudo apt install -y xvfb && 
sudo apt install -y xauth && 
sudo apt install -y xfonts-base && 
sudo apt install -y libxt-dev && 
sudo apt install -y libgsl-dev && 
sudo apt install -y libmagick++-dev && 
sudo R CMD javareconf

# qgis
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 6B827C12C2D425E227EDCA75089EBE08314DF160 &&
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable &&
sudo apt update &&
sudo apt install -y qgis qgis-plugin-grass saga

# grass
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 6B827C12C2D425E227EDCA75089EBE08314DF160 &&
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable &&
sudo apt update &&
sudo apt install -y grass

## flatpak ------------------------------------------------------------------------------------
# flatpak
sudo apt install -y flatpak &&
sudo apt install -y gnome-software-plugin-flatpak &&
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# apostrophe
flatpak install -y flathub org.gnome.gitlab.somas.Apostrophe

# spotify
flatpak install -y flathub com.spotify.Client

# gimp
flatpak install -y flathub org.gimp.GIMP

# discord
flatpak install -y flathub com.discordapp.Discord

# vlc
flatpak install -y flathub org.videolan.VLC

## snaps --------------------------------------------------------------------------------------
# install
sudo apt install -y snapd

# kcolorchooser
sudo snap install kcolorchooser

## dpkgs --------------------------------------------------------------------------------------
# rstudio
wget -c https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1106-amd64.deb
sudo dpkg -i rstudio-1.4.1106-amd64.deb
sudo apt install -fy && 
rm rstudio-1.4.1106-amd64.deb

# libreoffice
wget https://download.documentfoundation.org/libreoffice/stable/7.0.5/deb/x86_64/LibreOffice_7.0.5_Linux_x86-64_deb.tar.gz
tar -xvf LibreOffice_7.0.5_Linux_x86-64_deb.tar.gz
cd LibreOffice_7.0.5.2_Linux_x86-64_deb/DEBS
sudo dpkg -i *.deb 
cd ..; cd ..
rm -r LibreOffice_7.0.5.2_Linux_x86-64_deb
rm LibreOffice_7.0.5_Linux_x86-64_deb.tar.gz

wget https://download.documentfoundation.org/libreoffice/stable/7.0.5/deb/x86_64/LibreOffice_7.0.5_Linux_x86-64_deb_langpack_pt-BR.tar.gz
tar -xvf LibreOffice_7.0.5_Linux_x86-64_deb_langpack_pt-BR.tar.gz
cd LibreOffice_7.0.5.2_Linux_x86-64_deb_langpack_pt-BR/DEBS
sudo dpkg -i *.deb 
cd ..; cd ..
rm -r LibreOffice_7.0.5.2_Linux_x86-64_deb_langpack_pt-BR
rm LibreOffice_7.0.5_Linux_x86-64_deb_langpack_pt-BR.tar.gz

wget https://download.documentfoundation.org/libreoffice/stable/7.0.5/deb/x86_64/LibreOffice_7.0.5_Linux_x86-64_deb_helppack_pt-BR.tar.gz
tar -xvf LibreOffice_7.0.5_Linux_x86-64_deb_helppack_pt-BR.tar.gz
cd LibreOffice_7.0.5.2_Linux_x86-64_deb_helppack_pt-BR/DEBS
sudo dpkg -i *.deb 
cd ..; cd ..
rm -r LibreOffice_7.0.5.2_Linux_x86-64_deb_helppack_pt-BR
rm LibreOffice_7.0.5_Linux_x86-64_deb_helppack_pt-BR.tar.gz

# pdfsam
wget -c https://github.com/torakiki/pdfsam/releases/download/v4.2.4/pdfsam_4.2.4-1_amd64.deb &&
sudo dpkg -i pdfsam_4.2.4-1_amd64.deb &&
sudo apt install -fy &&
rm pdfsam_4.2.4-1_amd64.deb

# google chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome-stable_current_amd64.deb &&
sudo apt install -fy &&
rm google-chrome-stable_current_amd64.deb

# google earth
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78BD65473CB3BD13 &&
wget -c http://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb &&
sudo dpkg -i google-earth-pro-stable_current_amd64.deb &&
rm google-earth-pro-stable_current_amd64.deb

## fix broken
sudo apt clean && sudo apt update &&
sudo dpkg --configure -a &&
sudo apt install -f &&
sudo apt install -y --fix-broken 

## cleanup apt
sudo apt update &&
sudo apt autoclean -y &&
sudo apt autoremove -y

# end ----------------------------------------------------------------------
