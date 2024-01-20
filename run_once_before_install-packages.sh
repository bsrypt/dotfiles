{{ if eq .chezmoi.os "linux" -}}
#!/bin/sh

sudo apt install ripgrep
{{ else if eq .chezmoi.os "darwin" -}}
#!/bin/sh
brew install \
fish \
ripgrep \
bat \
lsd \
zoxide \

{{ end -}}
