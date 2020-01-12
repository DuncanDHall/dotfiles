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
