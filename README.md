# dotfiles
Just a simple dotfiles folder for Linux and Unix setups. Includes .bashrc and .vimrc. More things will be added soon!

#What it includes
## 1. vimrc
1. gruvbox theme
2. ctrl-p
3. emmet
4. youcompleteme
5. delimitMate
6. nerdtree
7. vim-css-color
8. incsearch
9. syntastic

## 2. bashrc
Still a work in progress, but I've got the following aliases set up:

1. c='clear'
2. ls='ls -Ash --color=auto'
3. push='git push origin master'
4. lgr='ls | grep --color'

## 3. install.sh
Automated bash script that installs my dotfiles and makes a backup directory of the user's dotfiles along with a timestamp. It uses vim-plug for installing plugins, so if you prefer something else such as pathogen or vundle, feel free to edit this script and .vimrc to suit your needs!
