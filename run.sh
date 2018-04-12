#! /bin/bash

read -n 1 -p "Would you like to Init or Save .dotfiles? (i/s) " ans;
echo "\n"
case $ans in
    i|I)
	ln -s ~/.dotfiles/.vi* ~/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/.vim/bundle/Vundle.vim
	vim +PluginInstall -c quitall -e > /dev/null 2>&1			
        echo "Done !";;
    s|S)
        echo "Save...";;
    *)
        exit;;
esac
