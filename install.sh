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

if [ ! -f "$PLUG" ]; then
    mkdir -p $PLUG
    ln -s $HOME/dotfiles/.vimrc ~/.config/nvim/init.vim
    
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qall
