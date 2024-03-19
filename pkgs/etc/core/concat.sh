set -xue

cd etc

ls | grep '.*\.d$' | while read l; do
    cat ${l}/* > ${l%.d}
    rm -r ${l}
done
