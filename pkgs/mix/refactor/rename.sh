mv $1 $2

find . | while read l; do
    sed -e "s|$1|$2|" -i $l
done
