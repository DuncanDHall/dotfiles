#  ZSH aliases
#  by Duncan Hall

# git
alias gcam='git add -A; git commit -m'
alias gs='git status'
alias g='git'

# navigation
function cs () { cd $1 && ls; }
# alias wwork='cs /Users/duncanhall/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/programming/Python/the-coding-interview'
# alias wjournal='cs /Users/duncanhall/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/programming/journal'
# alias wdotfiles='cs ~/dotfiles'

# fast editing
alias zshconfig='vim ~/dotfiles/.zshrc'
alias zshaliases='vim ~/dotfiles/ohmyzshcustom/aliases.zsh'
alias zshfunctions='vim ~/dotfiles/ohmyzshcustom/functions.zsh'
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
alias src='source ~/.zshrc ~/dotfiles/ohmyzshcustom/*.zsh'
alias email='neomutt'
alias mail='neomutt'
alias ff="lfcd"

# adding macvim
# alias v='/Applications/MacVim.app/Contents/bin/vim'
