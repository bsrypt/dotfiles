if status is-interactive
    # Commands to run in interactive sessions can go here
end
alias cat=bat
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ls=lsd
starship init fish | source
zoxide init fish | source

