export VIRTUAL_ENV_DISABLE_PROMPT=1

ENV_COLORING="%{$fg[green]%}"


get_git_dirty() {
  git diff --quiet || echo '*'
}

function _virtualenv_prompt_info() {
    if [ -n "$VIRTUAL_ENV" ]; then
        if [ -f "$VIRTUAL_ENV/__name__" ]; then
            local name=`cat $VIRTUAL_ENV/__name__`
        elif [ `basename $VIRTUAL_ENV` = "__" ]; then
            local name=$(basename $(dirname $VIRTUAL_ENV))
        else
            local name=$(basename $VIRTUAL_ENV)
        fi
        echo "$ENV_COLORING($name)%{$reset_color%}"
    fi
}

function _base_prompt {
    echo "%F{1}–%F{2}–%F{3}–%F{4}–%F{5}–%F{6}–%F{7}– %{$fg[yellow]%}%B%#%b %{$reset_color%}"
    echo "%B%F{1}•%F{5}•%F{4}•%F{6}•%F{2}•%F{3}•%F{7}•%b%f %{$reset_color%}"
    echo "%F{1}•%F{5}•%F{4}•%F{6}•%F{2}•%F{3}•%F{7}•%b%f %{$reset_color%}"
}

function _path_prompt_info() {
    echo "%{$fg[blue]%}%2~%{$reset_color%}"
}

function _git_prompt_info() {
    echo "${vcs_info_msg_0_}%{$reset_color%}"
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}%B•%b'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{5}[%c%u%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats       \
    '%F{5}%F{5}[%c%u%F{2}%b%F{5}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

theme_precmd () {
    vcs_info
}

setopt prompt_subst
PROMPT="
%{$reset_color%}$(_virtualenv_prompt_info)$(_base_prompt)"
RPROMPT='%{$reset_color%}$(_path_prompt_info) $(_git_prompt_info)%{$reset_color%}'

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd

