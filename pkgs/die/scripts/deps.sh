echo > urls.sh

while read l; do
    p=$(basename ${l})

    if test -f ${p}; then
        :
    else
        curl -L -o tmp ${l}; mv tmp ${p}
    fi

    echo ${l} >> urls.sh
    mix misc chksum ${p} sem >> urls.sh
    echo >> urls.sh
done
