# Terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT="%F{green}%n%f%F{green}@%F{green}%m%f%F{white}:%F{blue}%~%F{white}$ "

# Colorize ls output
alias ls='ls --color=auto'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dichlorodiphen/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dichlorodiphen/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dichlorodiphen/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dichlorodiphen/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Path
export PATH="$PATH:/Applications/Racket v8.11.1/bin"
export PATH="$PATH:/opt/homebrew/opt/vim/bin/vim"
export PATH="$PATH:/opt/apache-maven-3.9.6/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# superfile
export EDITOR=vim

# opam configuration
[[ ! -r /Users/dichlorodiphen/.opam/opam-init/init.zsh ]] || source /Users/dichlorodiphen/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
