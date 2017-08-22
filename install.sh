ln -sfv $HOME/dotfiles/.aliases ~
ln -sfv $HOME/dotfiles/.bashrc ~
ln -sfv $HOME/dotfiles/.bash_profile ~
ln -sfv $HOME/dotfiles/.gitconfig ~
ln -sfv $HOME/dotfiles/.gitignore_global ~
ln -sfv $HOME/dotfiles/.tmux.conf ~
ln -sfv $HOME/dotfiles/.vimrc ~
ln -sfv $HOME/dotfiles/.zshrc ~
ln -sfv $HOME/dotfiles/.bash_prompt ~
ln -sfv $HOME/dotfiles/.exports ~
ln -sfv $HOME/dotfiles/.extra ~
ln -sfv $HOME/dotfiles/.functions ~

PLUG=$HOME/.vim/autoload/plug.vim
NVIM_CONFIG=$HOME/.config/nvim
NVIM_PLUG=$HOME/.local/share/nvim/site/autoload

if [ ! -f "$PLUG" ]; then
    mkdir -p $NVIM_CONFIG
    ln -sfv $HOME/dotfiles/.vimrc $NVIM_CONFIG/init.vim
	
    mkdir -p $HOME/.vim/autoload
    curl -o $HOME/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    mkdir -p $NVIM_PLUG
    ln -sfv $PLUG $NVIM_PLUG

fi

vim +PlugInstall +qall
