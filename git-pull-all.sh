#!/bin/bash
while read F; do
    cd $F
    echo -e "\n"$F
    git pull
done </home/skramer/scripts/git-repos
