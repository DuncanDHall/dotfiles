# first one is about
# `> journal my journal entry`
#
# be equivalent to this:
#
# `> cd path/to/journal && v YYMMDD_my_journal_entry`
#
# and `> journal` be `> cd path/to/journal && vmr` (vim most recent)

journal () {
    cd "/Users/duncanhall/Library/Mobile Documents/com~apple~CloudDocs/Documents/programming/journal"

    d=$(date "+%y%m%d")

    # if journal entry for this date exists:
    setopt NULL_GLOB
    for f in ./$d*(.); do
        v "$f"
        return
    done
    unsetopt NULL_GLOB

    # else:
    n=$(echo "$*" | tr " " "-")
    v "$d-$n.md"
}

# use imagemagick to convert all .HEIC files to .jpg in current directory
heictojpg () {
    for file in ./*HEIC
    do
        echo "processing '$file'..."
        mogrify -format jpg "$file"
    done
    echo "done"
}

# https://github.com/gokcehan/lf
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# run python scripts automatically on save with fswatch
fswatchpy () {
    fswatch -0 -o ./$1 | xargs -0 -n 1 python3 ./$1
}
# alias fswatchpy='fswatch -0 -o ./ | xargs -0 -n 1 python3'
