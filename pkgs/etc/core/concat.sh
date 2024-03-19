set -xue

cd etc

ls | grep '.*\.d$' | grep -v ananicy | grep -v bash_completion | grep -v grub | grep -v init | while read l; do
    cat ${l}/* > ${l%.d}
    rm -r ${l}
done
