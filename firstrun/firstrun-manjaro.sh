#!/usr/bin/env bash
export HOME_PATH='/home'
ALLTRUE=false

if [[ $1 = '--alltrue' ]]; then
  ALLTRUE=true
fi

# Loading echo functions
source $HOME_PATH/$USER/.bash_things/firstrun/echo.sh

# Package update and upgrade
gecho 'Updating and upgrading packages'
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

if [[ $ALLTRUE = true ]]; then
  # Enable bash_things
  bgecho 'Enable bash_things in .bashrc'
  echo >> $HOME_PATH/$USER/.bashrc
  echo "# Customization" >> $HOME_PATH/$USER/.bashrc
  echo "HOME_PATH='${HOME_PATH}'" >> $HOME_PATH/$USER/.bashrc
  echo "source ${HOME_PATH}/$USER/.bash_things/loader.sh" >> $HOME_PATH/$USER/.bashrc

  # Improved Graphic Drivers
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/mesa.sh
  # Dev-Tools
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/dev-tools.sh
  # Gnome 3 hacks
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/gnome3.sh
  # exfat drivers
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/exfat.sh
  # BCM43142 Drivers
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/BMC43142.sh
  # Docker
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/docker.sh
  # docker-machine
  $HOME_PATH/$USER/.bash_things/firstrun/Linux/docker-machine.sh
  # NVM
  $HOME_PATH/$USER/.bash_things/firstrun/nvm.sh
  # GIT superpush
  $HOME_PATH/$USER/.bash_things/firstrun/git.sh
else
  # Enable bash_things
  read -p "Enable bash_things? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    bgecho 'Enable bash_things in .bashrc'
    echo >> $HOME_PATH/$USER/.bashrc
    echo "# Customization" >> $HOME_PATH/$USER/.bashrc
    echo "HOME_PATH='${HOME_PATH}'" >> $HOME_PATH/$USER/.bashrc
    echo "source ${HOME_PATH}/$USER/.bash_things/loader.sh" >> $HOME_PATH/$USER/.bashrc
  fi

  # Improved Graphic Drivers
  read -p "Enable Improved Graphic Drivers? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/mesa.sh
  fi

  # Dev-Tools
  read -p "Install Dev-Tools? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/dev-tools.sh
  fi

  # Gnome 3 hacks
  read -p "Enable Gnome 3 Hacks? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/gnome3.sh
  fi

  # exfat drivers
  read -p "Install exfat drivers? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/exfat.sh
  fi

  # BCM43142 Drivers
  read -p "Install BCM43142 Drivers? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/BMC43142.sh
  fi

  # Docker
  read -p "Install Docker? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/docker.sh
  fi

  # docker-machine
  read -p "Install docker-machine? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/Linux/docker-machine.sh
  fi

  # NVM
  read -p "Install NVM? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/nvm.sh
  fi

  # GIT superpush
  read -p "Enable GIT superpush? [Y/n] " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo
  else
    $HOME_PATH/$USER/.bash_things/firstrun/git.sh
  fi
fi

# echo Done
bgecho 'Done!'

# Final reboot
read -p "Reboot system now? [Y/n] " -n 1 -r
if [[ $REPLY =~ ^[Nn]$ ]]
then
  echo
else
  sudo reboot
fi
