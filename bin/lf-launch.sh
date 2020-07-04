#!/bin/bash

# Launch-: The XDG Killer with ing feature
# Launches files based on their mimetype
# Usage: launch- [FILE...]

case $(file --mime-type "$*" -bL) in
    # Check for the mimetype of your file
    text/* | inode/x-empty | application/json | application/octet-stream)
        # Launch using your favorite application
        "$EDITOR" "$*"
        ;;
    video/* | audio/* | image/gif)
        mpv "$*" &>/dev/null 2>&1 &
        ;;
    application/pdf | application/postscript)
        # zathura throws some warnings for some reasons
        zathura "$*" &>/dev/null 2>&1 &
        ;;
    image/*)
        sxiv "$*" &>/dev/null 2>&1 &
        ;;
    application/zip)
        unzip "$*" -d "${1%.*}"
        ;;
esac
