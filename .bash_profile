# Get the aliases and functions
#if [ -f ~/.bashrc ]; then
    #. ~/.bashrc
#fi

#if [ -f ~/.aliases ]; then
    #. ~/.aliases
#fi

for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

set -o vi # vi mode

#################################################################################
# Bash History https://unix.stackexchange.com/a/1292
#################################################################################

# Maximum number of history lines in memory
export HISTSIZE=50000
# Maximum number of history lines on disk
export HISTFILESIZE=50000
# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file 
#  instead of overwriting it
shopt -s histappend

# After each command, append to the history file 
#  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

#################################################################################
# Completion 
#################################################################################
if [ -f /etc/bash_completion ]; then
 source /etc/bash_completion
fi

#################################################################################
# Better `cd`ing 
#################################################################################

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell;

# Autocorrect on directory names to match a glob.
shopt -s dirspell 2> /dev/null

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

#################################################################################
# Colors / Term 
#################################################################################

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
