set -xue

cd /sys/fs/cgroup/srv

find . -type d | while read l; do
    rmdir ${l} || true
done
