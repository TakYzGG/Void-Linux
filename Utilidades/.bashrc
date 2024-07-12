# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\[\e[95m\]\u\[\e[94m\] \w\[\e[0m\]]\[\e[91m\]\\$\[\e[0m\] ' 
