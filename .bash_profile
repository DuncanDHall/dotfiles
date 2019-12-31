export PATH=$PATH:~/bin:~/Library/Python/3.6/bin

#=== Git Stuff ===#
#   allows access to $git_branch and $git_dirty variables for prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
source ~/.bash/git-completion.bash

#function gcam { git add -A; git commit -m \""$@"\" }  # doesn't work
alias gcam="git add -A; git commit -m"
alias gpom="git push origin master"
alias gp="git push"
alias gs="git status"
alias gb="git branch"
alias g="git"
alias o="open ."

# gtree is like tree but uses ./.gitignore!
# source: https://unix.stackexchange.com/questions/291282/have-tree-hide-gitignored-files
function gtree {
    git_ignore_files=("$(git config --get core.excludesfile)" .gitignore ~/.gitignore)
    ignore_pattern="$(grep -hvE '^$|^#' "${git_ignore_files[@]}" 2>/dev/null|sed 's:/$::'|tr '\n' '\|')"
    if git status &> /dev/null && [[ -n "${ignore_pattern}" ]]; then
      tree -I "${ignore_pattern}" "${@}"
    else
      tree "${@}"
    fi
}
# function gtree {
#     # tree respecting gitignore
#
#     local ignored=$(git ls-files -ci --others --directory --exclude-standard)
#     local ignored_filter=$(echo "$ignored" \
#                     | egrep -v "^#.*$|^[[:space:]]*$" \
#                     | sed 's~^/~~' \
#                     | sed 's~/$~~' \
#                     | tr "\\n" "|")
#     tree --prune -I ".git|${ignored_filter: : -1}" "$@"
# }


#=== Prompt ===#

PROMPT_DIRTRIM=2  # automatic trimming of \w with bash 4!
PS1="\r\[\033[0;36m\]\W\n\[\033[0;33m\]\$(add_venv_info)\n\[\033[1;36m\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\[\033[1;31m\]> \[\033[1;00m\]"

# prompt fixing for virtualenv
add_venv_info () {
    if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
        VIRT_ENV_TXT=" "
        if [ "x" != x ] ; then
            VIRT_ENV_TXT=" "
        else
            if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
                # special case for Aspen magic directories
                # see http://www.zetadev.com/software/aspen/
                VIRT_ENV_TXT="[`basename \`dirname \"$VIRTUAL_ENV\"\``]"
            elif [ "$VIRTUAL_ENV" != "" ]; then
                VIRT_ENV_TXT="venv: `basename \"$VIRTUAL_ENV\"`"
            fi
        fi
        if [ "${VIRT_ENV_TXT}" != " " ]; then
           echo -e ${VIRT_ENV_TXT}"\n "
        else
           echo " "
        fi
    fi
}


#=== LS/Colors configuration ===#
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
# alias ls="ls -ctG"      # simple
alias l="ls -ActGFlh"   # detail
#set colored-stats on
export TERM=xterm-256color # for vim and tings


#=== Directory Shortcuts (warps) ===#
alias "wclass"="cs /Users/duncan/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/class"
alias "wclass_"="cd /Users/duncan/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/class"
alias "w~"="cs ~"
alias "whome"="cs ~"
alias "ww"="cs /Users/duncanhall/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/programming/Python/the-coding-interview"
alias "wj"="cs /Users/duncanhall/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/programming/journal"


#=== Virtualenv things ===#
# (found here: http://davedash.com/tutorial/virtualenv/)
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

alias dve="deactivate"

# autoenv is amazing
# source $(brew --prefix autoenv)/activate.sh
# export AUTOENV_ENABLE_LEAVE="non-null string" # wasn't working, and takes time


#=== Miscilaneous Aliases ===#
# bash funcionality
function cs { cd "$@" && ls; }
alias ..="cd .."
alias ...='cd ../../'
alias ....='cd ../../..'
alias cd..="cs .."
alias c="clear"
alias e="exit"
alias bpr="vim ~/.bash_profile"
alias vimrc="vim ~/.vimrc"
# vim most recent – opens most recently edited file in current directory
alias vmr='vim -- $(ls -t | head -n 1)'
# reload .bash_profile
alias src='source ~/.bash_profile ~/.bashrc'

# python version selection
alias python="python3"
alias ptd="python -m unittest discover -v"
alias pip="pip3"

# application aliases
alias v="vim"
alias jupnb="jupyter notebook"
alias intellij="/Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea"
alias charm="/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm"



#=== Miscellaneous ===#

# Please put eval $(thefuck --alias) in your ~/.bashrc and apply changes with source ~/.bashrc or restart your shell.
# More details - https://github.com/nvbn/thefuck#manual-installation
eval $(thefuck --alias)

# orient to current directory (done by iterm2 in preferences)
cd /Users/duncanhall/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/

