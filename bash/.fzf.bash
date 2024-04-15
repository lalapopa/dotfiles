# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lalapopa/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lalapopa/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lalapopa/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/lalapopa/.fzf/shell/key-bindings.bash"
