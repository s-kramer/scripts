#!/bin/bash
while read F; do
    cd $F
    git status
done </home/skramer/scripts/git-repos
