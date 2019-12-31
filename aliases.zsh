# ZSH aliases

# git
alias gcam='git add -A; git commit -m'
alias gs='git status'
alias g='git'

# navigation
function cs () { cd $1 && ls; }
alias ww='cs /Users/duncanhall/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/programming/Python/the-coding-interview'
alias "wj"="cs /Users/duncanhall/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/programming/journal"

# fast editing
alias zshrc='vim ~/dotfiles/.zshrc'
alias zshaliases='vim ~/dotfiles/aliases.zsh'
alias vimrc='vim ~/dotfiles/.vimrc'
alias vmr='vim -- $(ls -t | head -n 1)'

# python version selection
alias python='python3'
alias pip='pip3'
alias ptd='python3 -m unittest discover -v'

# miscelaneous
alias v='vim'
alias o='open .'
alias c='clear'
alias src='source ~/.zshrc ~/.oh-my-zsh/custom/*.zsh'

