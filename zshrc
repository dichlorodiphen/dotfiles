export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.9.jdk/Contents/Home"
export PATH=$PATH:/opt/apache-maven/bin
export PATH=$PATH:/opt/nvim/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:$HOME/go/bin

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT="%F{green}%n%f%F{green}@%F{green}%m%f%F{white}:%F{blue}%~%F{white}$ "


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dichlorodiphen/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dichlorodiphen/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dichlorodiphen/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dichlorodiphen/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

