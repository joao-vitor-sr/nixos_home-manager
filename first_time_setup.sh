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

echo "This script is aimed for the first time setup, it install some packages that are a little bit hard to install with home-manager\n\n"
echo "are you sure you want to continue? (y/n)\n"

read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  install_nvchad
  echo "Done!"
else
    echo "Aborting..."
fi

