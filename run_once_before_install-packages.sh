{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh
sudo apt-add-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install software-properties-common
sudo apt install $(cat packages.txt)
{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
brew install $(cat packages.txt)
{{ end -}}
