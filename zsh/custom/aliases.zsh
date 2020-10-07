# Open config files
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"

# Save and fetch dotfiles
alias gpvimconfig="(cd ~/dotfiles && git add vim/.vimrc && git commit && git push origin master)"
alias gfdotfiles="(cd ~/dotfiles && git pull origin master)"

# Swap files for vim
alias findswp="find . -type f -name '*.swp'"
alias delswp="find . -type f -name '*.swp' -delete"

# Connect to remote servers (protected)
