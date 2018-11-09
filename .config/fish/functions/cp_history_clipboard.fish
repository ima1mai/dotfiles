#!/usr/bin/end fish
#

function __cp_history_clipboard_usage
    printf "
Description:
    Copy the most recent command history into clipboard.

Usage:
    cp_history_clipboard <number of lines copied>

Required Dependencies:
    Mac: pbcopy
    Linux: xsel
"
end

function cp_history_clipboard --argument n
    if test $n -le 0
        echo 'Invalid argument. argument should be greater than 0'
        __cp_history_clipboard_usage
        return 1
    end

    set -l copy_to_clipboard  ""

    # select command to copy strings to clipboard.
    switch (uname)
        case Darwin
            set copy_to_clipboard 'pbcopy'
        case Linux
            set copy_to_clipboard 'xsel --clipboard --input'
        case *
            echo 'Not supported Operation System'
            return 1
    end

    eval (echo "history | head -n $n | $copy_to_clipboard")
end

