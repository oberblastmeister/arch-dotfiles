cd ~
sudo apt update
sudo apt upgrade

setxkbmap -option ctrl:nocaps
# install neovim dependencies
sudo apt install ripgrep fd-find universal-ctags ssh-askpass-gnome ssh-askpass xclip xsel rlwrap less more most mplayer

# install node and related
nvm install v13.11.1
npm install -g neovim
npm install eslint --save-dev
npx eslint --init

# install python and related
# install dependencies for pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
# install pyenv installer (already installed with zsh-pyenv)
# curl https://pyenv.run | bash
# exec $SHELL
pyenv install -v 3.8.2
pip install pandas
pip install pynvim
pip install neovim
pip install neovim-remote
pip install jedi
pip install pylint
pip install flake8
pip instal django

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install latest stable neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 50

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.otf

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/brian/.local/kitty.app/bin/kitty 50

# download kitty themes
git clone --depth 1 git@github.com:dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
cd ~/.config/kitty
ln -s ./kitty-themes/themes/gruvbox_dark.conf ~/.config/kitty/theme.conf
cd ~

# install base16 vim
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# add this to base16
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
    #[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        #eval "$("$BASE16_SHELL/profile_helper.sh")"

# install enhancd
cd ~
git clone https://github.com/b4b4r07/enhancd
# add enhancd to your bash profile (or sourced file of choice)
echo "source ~/enhancd/init.sh"  >> ~/.bash_profile
reload bash profile
source ~/.bash_profile

# xcape
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape.git
cd xcape
make
sudo make install
cd ..

# bat
sudo apt install llvm libclang-dev
git clone https://github.com/sharkdp/bat.git
cd bat
cargo install bat
# install bat themes
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
git clone https://github.com/peaceant/gruvbox.git
bat cache --build
cd ~
# remember to write how jupyter plugins were installed

# install nnn
git clone https://github.com/jarun/nnn.git
cd nnn
sudo make strip install
cd ~

sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

vim -c PlugUpgrade PlugInstall
