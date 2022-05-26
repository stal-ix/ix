git filter-branch --tag-name-filter 'cat' -f --tree-filter '
find . -type f -name "*.tgz" -o -name "*.zip" -o -name "*.gz" -o -name "*.xz" -o -name "*.bz2" -o -name "*.tar" | while read file; do
    git rm -r -f --ignore-unmatch $file
done
' -- --all
