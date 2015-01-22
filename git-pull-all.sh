#!/bin/bash
while read F; do
    cd $F
    git pull
done </home/skramer/scripts/git-repos
