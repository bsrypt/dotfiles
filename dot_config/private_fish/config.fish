if status is-interactive
    # Commands to run in interactive sessions can go here
    clear
end
export GPG_TTY=$(tty)
export winhost=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
if test -z "$(grep -P '[[:space:]]winhost' /etc/hosts)"
  printf '%s\t%s\n' "$winhost" "winhost" | sudo tee -a "/etc/hosts"
end
set -g fish_greeting
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/bin $PATH
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ls=lsd
if command -v batcat &> /dev/null 
  alias bat=batcat
end
alias cat=bat
starship init fish | source
zoxide init fish | source

