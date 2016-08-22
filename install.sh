[ -e .vim ] && echo ".vim directory exists! Exiting!" && exit 0
echo "+++ Cloning from Github..."
git clone https://github.com/mstahl/vim-scripts.git .vim > /dev/null
echo "+++ Creating symbolic link..."
ln -s .vim/vimrc .vimrc
echo "+++ Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "+++ Installing plugins with Vundle"
vim +PluginInstall +qall
echo "+++ Done!"
