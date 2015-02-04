#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Commit message required!"
    exit 1;
fi

in_array() { #{{{
    local haystack=${1}[@]
    local needle=${2}
    for i in ${!haystack}; do
        if [[ "${i}" == "${needle}" ]]; then
            return 0
        fi
    done
    return 1
} 
#}}}

declare -a executable_dirs
readarray -t executable_dirs < /home/skramer/scripts/git-executable-dirs

in_array executable_dirs "$PWD"

# if not found
if [[ $? -eq 1 ]]; then
    reload-git-ignore.sh
fi

git add .
git commit -m "$1"
git push
