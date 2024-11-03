set -xue

cd etc

find -type d -name '*.d' | grep -v dbus-1 | grep -v ananicy | grep -v bash_completion | grep -v grub | grep -v init | grep -v xinetd | grep -v pam | grep -v profile | while read l; do
    cat ${l}/* > ${l%.d}
    rm -r ${l}
done

if test -f shells; then
    cat shells | sort | uniq > _
    mv _ shells
fi
