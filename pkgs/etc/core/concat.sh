set -xue

cd etc

ls | grep '.*\.d$' | grep -v ananicy | while read l; do
    cat ${l}/* > ${l%.d}
    rm -r ${l}
done
