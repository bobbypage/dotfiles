for file in ~/.{bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

set -o vi # vi mode

#################################################################################
# History Settings
#################################################################################

# Maximum number of history lines in memory
export HISTSIZE=50000

# Maximum number of history lines on disk
export HISTFILESIZE=50000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Append to the history file rather than overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Save multi-line commands with newlines
shopt -s lithist

# Annotate the history lines with timestamps in .bash_history
export HISTTIMEFORMAT=""

# Record each line as it gets issued
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

function reload_history {
  history -a
  history -c
  history -r
}
if ! [[ "$PROMPT_COMMAND" =~ "reload_history" ]]; then
    precmd_functions+=(reload_history)
    PROMPT_COMMAND="reload_history; $PROMPT_COMMAND"
fi

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

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

[ -r "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# Tab completions
# Show possible completions and cycle through them.
#bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'

# Enable kubectl completions
#
if type "kubectl" &> /dev/null; then
  source <(kubectl completion bash)
fi

if type "rg" &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
fi

if type "nvim" &> /dev/null; then
  export VISUAL=nvim
  export EDITOR="$VISUAL"
fi
