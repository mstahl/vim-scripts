[ -e .vim ] && echo ".vim directory exists! Exiting!" && exit 0
echo "+++ Cloning from Github..."
git clone https://github.com/mstahl/vim-scripts.git .vim > /dev/null
echo "+++ Creating symbolic link..."
ln -s .vim/vimrc .vimrc
cd .vim
echo "+++ Creating submodules"
git submodule init > /dev/null   # Pathogen plugins installed as submodules
git submodule update > /dev/null # Don't forget to update them!
echo "+++ Done!"
