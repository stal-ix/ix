git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref –d
git reflog expire --expire=now –all
git gc --prune=now --aggressive
