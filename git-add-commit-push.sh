#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Commit message required!"
    exit 1;
fi

if [[ "$PWD" != "/home/skramer/scripts" ]]; then
    reload-git-ignore.sh
fi

git add .
git commit -m "$1"
git push
