# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export GOROOT=$HOME/go
export GOPATH=$HOME/gopath
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

set -o vi # vi mode
