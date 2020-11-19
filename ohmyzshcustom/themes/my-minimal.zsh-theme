ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""

export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}("
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=")"


function _git_prompt_info {
    git_prompt_info
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
        echo "$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX$name$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX "
    fi
}

function _path_prompt_info() {
    echo "%{$fg[blue]%}%2~ "
}


PROMPT="
$(_virtualenv_prompt_info)%{$fg[yellow]%}%B%#%b "

RPROMPT="$(_path_prompt_info)$(_git_prompt_info)%{$reset_colors%}%{$fg[white]%}"
