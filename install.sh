#!/bin/bash
sudo apt-get install vim tmux zsh fish curl cmake python-dev  -y
echo "Switching from bash to zsh..."
chsh -s $(which zsh)
echo "Switch was successful!"

#####BackupFolder#####
echo "Creating backup folder .dotfilesbackup-(today's date):" DATE=$(date +%F)
DIRNAME=.dotfilesbackup
DIR=$DIRNAME-$DATE
mkdir "$DIR"
echo "Successfully created directory. Name is $DIR."

#####Vimrc#####
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
mkdir ~/.vim/colors
cp ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors
~/.vim/plugged/youcompleteme/./install.sh

#####bashrc#####
echo "Plugins installed successfully, now installing .bashrc..."
cp ~/.bashrc ~/"$DIR"
echo "Successfully copied bashrc to backup directory."
rm ~/.bashrc
echo "Successfully removed .bashrc!"
ln -s ~/dotfiles/.bashrc ~/.bashrc
echo "Successfully symlinked .bashrc."

#####config.fish#####
echo ".bashrc installed successfully. Now installing fish's config..."
cp ~/.config/fish/config.fish ~/"$DIR"
echo "Successfully copied config.fish to backup directory."
rm ~/.config/fish/config.fish
echo "Successfully removed config.fish!"
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
echo "Successfully symlinked config.fish."

#####tmux.conf#####
cp ~/.tmux.conf ~/"$DIR"
echo "Successfully copied tmux conf file."
rm ~/.tmux.conf
echo "Successfully removed tmux conf!"
ln -s  ~/dotfiles/.tmux.conf ~/.tmux.conf
tmuxsource
echo "Installed tmux successfully."


echo "All done."
echo "Welcome, "$USER"! If you wish to switch to bash, feel free to use the following command:"
echo "$ chsh -s $(which bash)"
