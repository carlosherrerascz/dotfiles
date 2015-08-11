#!/bin/bash
sudo apt-get install vim tmux
cd ~/
echo "Creating backup folder .dotfilesbackup-(today's date):"
DATE=$(date +%F)
DIRNAME=.dotfilesbackup
DIR=$DIRNAME-$DATE
mkdir "$DIR"
echo "Successfully created directory. Name is $DIR."
cp ~/.vimrc ~/"$DIR"
echo "Successfully copied vimrc to backup directory."
rm ~/.vimrc
echo "Successfully removed .vimrc!"
ln -s ~/dotfiles/.vimrc ~/.vimrc
echo "Installed vimrc from dotfiles folder successfully. Now downloading vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Downloaded successfully! Installing Vim plugins..."
vim +PlugInstall +qall
echo "Plugins installed successfully, now installing .bashrc..."
cp ~/.bashrc ~/"$DIR"
echo "Successfully copied bashrc to backup directory."
rm ~/.bashrc
echo "Successfully removed .bashrc!"
ln -s ~/dotfiles/.bashrc ~/.bashrc
echo ".bashrc installed successfully."
echo "All done."
echo "Welcome, "$USER"!"
