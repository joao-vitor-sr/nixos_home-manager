#!/usr/bin/env bash

install_nvchad ()
{
  # validate if git is installed
  if ! command -v git &> /dev/null
  then
      echo "git could not be found, please install it first"
      exit
  fi

  echo "Removing current nvim config"
  rm -rf $HOME/.config/nvim/ 
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 

  ln -s $HOME/.config/home-manager/configs/nvchad/ $HOME/.config/nvim/lua/custom
}

install_wallpapers ()
{
  # get wallpapers from a directory on a public google drive
  echo "Downloading wallpapers"
  wget https://drive.google.com/file/d/1XVsLu3ayslExmpuYhh4TOQgsIqe_B9Ib/view?usp=share_link -O /tmp/wallpapers.zip

  # validate if unzip is installed
  if ! command -v unzip &> /dev/null
  then
      echo "unzip could not be found, please install it first"
      exit
  fi

  echo "Unzipping wallpapers"
  mkdir -p $HOME/pcs/
  
  unzip /tmp/wallpapers.zip -d $HOME/pcs/
}

echo "This script is aimed for the first time setup, it install some packages that are a little bit hard to install with home-manager\n"
echo "are you sure you want to continue? (y/n)"

read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  install_nvchad
  install_wallpapers
  echo "Done!"
else
    echo "Aborting..."
fi

