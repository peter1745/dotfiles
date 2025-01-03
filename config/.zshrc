# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/peter/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

prompt walters

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'

. "$HOME/.cargo/env"

export PATH=$HOME/.local/bin:~/nvidia/NVIDIA-Nsight-Graphics-2024.3/host/linux-desktop-nomad-x64/:~/tools/:$PATH
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
