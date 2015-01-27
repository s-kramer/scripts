#!/bin/bash
while read F; do
    cd $F
    echo -e "\n"$F
    git status
done </home/skramer/scripts/git-repos
