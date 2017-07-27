ln -sfv $HOME/dotfiles/.aliases ~
ln -sfv $HOME/dotfiles/.bash_profile ~
ln -sfv $HOME/dotfiles/.gitconfig ~
ln -sfv $HOME/dotfiles/.gitignore_global ~
ln -sfv $HOME/dotfiles/.tmux.conf ~
ln -sfv $HOME/dotfiles/.vimrc ~
ln -sfv $HOME/dotfiles/.zshrc ~

VUNDLE=$HOME/.vim/bundle/Vundle.vim

if [ ! -d "$VUNDLE" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
