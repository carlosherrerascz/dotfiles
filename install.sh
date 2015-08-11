#!/bin/bash
sudo apt-get install vim tmux fish
chsh -s /usr/bin/fish
echo "Creating backup folder .dotfilesbackup-(today's date):" DATE=$(date +%F)
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
#vim +PlugInstall +qall


echo "Plugins installed successfully, now installing .bashrc..."
cp ~/.bashrc ~/"$DIR"
echo "Successfully copied bashrc to backup directory."
rm ~/.bashrc
echo "Successfully removed .bashrc!"
ln -s ~/dotfiles/.bashrc ~/.bashrc
echo "Successfully symlinked .bashrc."


echo ".bashrc installed successfully. Now installing fish's config..."
cp ~/.config/fish/config.fish ~/"$DIR"
echo "Successfully copied config.fish to backup directory."
rm ~/.config/fish/config.fish
echo "Successfully removed config.fish!"
sudo ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
echo "Successfully symlinked config.fish."

echo "All done."
echo "Welcome, "$USER"! If you wish to switch to bash,feel free to use the following command:"
echo "$ chsh -s /usr/bin/bash"
