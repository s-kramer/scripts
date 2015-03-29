find . -perm /111 -type f | grep -v git | sed 's#^./##' | sort | grep -w -v -f .gitignore - >> .gitignore
