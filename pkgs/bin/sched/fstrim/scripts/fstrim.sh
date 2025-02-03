set -xue

cat /proc/mounts | grep '^/dev' | awk '{print $2}' | while read l; do
    fstrim -v ${l} || true
done
