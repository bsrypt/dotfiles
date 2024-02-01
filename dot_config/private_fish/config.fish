if status is-interactive
    # Commands to run in interactive sessions can go here
end
clear
export GPG_TTY=$(tty)
export EDITOR=nvim
export winhost=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
if test -z "$(grep -P '[[:space:]]winhost' /etc/hosts)"
  printf '%s\t%s\n' "$winhost" "winhost" | sudo tee -a "/etc/hosts"
  clear
end
set -g fish_greeting
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/bin $PATH
alias vim=nvim
alias l='lsd -l'
alias la='lsd -a'
alias lt='lsd --tree'
alias ls='lsd'
if command -v wezterm.exe &> /dev/null 
  alias wezterm=wezterm.exe
end
if command -v batcat &> /dev/null 
  alias bat=batcat
end
alias cat=bat
starship init fish | source
zoxide init fish | source

