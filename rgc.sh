#!/bin/bash

# Check if the first argument is provided
if [ -z "$1" ]; then
    echo "Usage: rgc [do|undo]"
    exit 1
fi

# Perform the requested operation
case "$1" in
    do)
        if [ -d ".git" ]; then
            cd .git
            hg init > /dev/null 2>&1
            hg add > /dev/null 2>&1
            hg commit -m "Do" > /dev/null 2>&1
            echo "Initialized Mercurial repository and committed changes."
        else
            echo "Error: .git directory not found in the current directory."
            exit 1
        fi
        ;;
    undo)
        if [ -d ".git" ]; then
            cd .git
            hg revert --all
            hg purge --all
            echo "Reverted all changes in the Mercurial repository."
        else
            echo "Error: .git directory not found in the current directory."
            exit 1
        fi
        ;;
    *)
        echo "Invalid command. Usage: rgc [do|undo]"
        exit 1
        ;;
esac

