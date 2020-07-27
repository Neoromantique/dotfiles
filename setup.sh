#!/bin/bash

GREEN='\033[0;32m'
RESET='\033[0m'

read -p "Install dependencies? [Ubuntu only]" -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install curl vim silversearcher-ag nmap neofetch gdebi git ranger tig mycli pgcli fzf jq miller newsboat
fi

read -p "Delete old backups? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "${GREEN} Wiping old backups ${RESET}"
	rm -rf ~/.config/i3status~
	rm -rf ~/.config/i3~
        rm -rf ~/.vim~
	rm -f ~/.vimrc~
	rm -f ~/.bashrc~
	rm -f ~/.zshrc~
	echo -e "${GREEN} Deleted old backups ${RESET}"
fi

read -n 1 -p "Is this desktop or laptop? (d/l/q) " ans;

case $ans in
    d|D)
        PLATFORM='desktop';;
    l|L)
        PLATFORM='laptop';;
    *)
        exit;;
esac

echo -e "${GREEN} Backing Up and moving configs ${RESET}"

mv ~/.config/i3status ~/.config/i3status~
mv ~/.config/i3 ~/.config/i3~
mv ~/.bashrc ~/.bashrc~
mv ~/.zshrc ~/.zshrc~
mv ~/.vimrc ~/.vimrc~
mv ~/.vim ~/.vim~

echo -e "${GREEN} Preparing ${RESET}"

touch ~/.bashrc ~/.vimrc
mkdir -p ~/.config/wmfs
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/colors


# Create tmp dir
mkdir tmp/

# obsolette for now
# ln -rsf wmfsrc ~/.config/wmfs/wmfsrc

ln -rsf ${PLATFORM}/i3/config ~/.config/i3/config
ln -rsf ${PLATFORM}/i3status/config ~/.config/i3status/config

ln -rsf .zshrc ~/.zshrc
ln -rsf .bashrc ~/.bashrc

read -p "Install screen lock unit for systemd? Requires sudo " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo ln -rsf i3lock.service /etc/systemd/system/i3lock.service
	sudo systemctl enable i3lock.service
fi
mkdir -p ~/.vim
ln -rsf .vimrc ~/.vimrc

#git clone https://github.com/neoclide/coc.nvim ~/.vim/pack/plugins/start/coc.nvim
#cd ~/.vim/pack/plugins/start/coc.nvim && ./install.sh && yarn install --frozen-lockfile

echo -e "${GREEN} Installing Pathogen ${RESET}"

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.vim/plugin

#wget "https://www.vim.org/scripts/download_script.php?src_id=26272" -O ~/.vim/plugin/switch.vim

echo -e "${GREEN} Installing Deps ${RESET}"
echo -e "vim-airline"
echo -e "${GREEN} Please run :helptags on first run ${RESET}"

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline &> /dev/null

echo -e "${GREEN} nerdtree ${RESET}"

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree &> /dev/null

echo -e "${GREEN} mustang colour theme ${RESET}" 
git clone https://github.com/croaker/mustang-vim tmp/ &> /dev/null
cp tmp/colors/mustang.vim ~/.vim/colors/

echo -e "${GREEN} clearning up ${RESET}" 

rm -rf tmp/


echo -e "${GREEN} booyah, there you go! ${RESET}"
