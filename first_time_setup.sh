#!/usr/bin/env bash

install_lvim ()
{
  # validate if git is installed
  if ! command -v git &> /dev/null
  then
      echo "git could not be found, please install it first"
      exit
  fi

  echo "Removing current nvim config"
  rm -rf $HOME/.config/nvim/ 

  echo "Installing LunarVim"
  LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

  ln -s $HOME/.config/home-manager/configs/lvim/config.lua $HOME/.config/lvim/config.lua
}

echo "This script is aimed for the first time setup, it install some packages that are a little bit hard to install with home-manager\n\n"
echo "are you sure you want to continue? (y/n)\n"

read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then

  install_lvim
  echo "Done!"
else
    echo "Aborting..."
fi

