#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Commit message required!"
    exit 1;
fi

git add .
git commit -m "$1"
git push
