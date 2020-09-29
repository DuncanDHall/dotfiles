# Set breakpoint() in Python to call pudb
export PYTHONBREAKPOINT="pudb.set_trace"
export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"


# lf starts in the current directory and changes the working directory
# accordingly when you move around. On the other hand, when you quit lf, the
# launching shell remains in the starting directory. This is a limitation of
# shells since it is not possible for a program to change the working directory
# of the parent process. However, you can define a shell function for this
# purpose as a workaround if you want to stay on the last visited directory
# when you quit:
LFCD="~/.config/lf/lfcd.sh"                            # pre-built binary
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# command history alterations
unsetopt inc_append_history
unsetopt share_history
