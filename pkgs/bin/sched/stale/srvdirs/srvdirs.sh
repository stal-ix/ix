set -xue

ls /var/run | grep -v resolvconf | grep -v runsvdir | sort > 1
ls /etc/services | sort > 2

comm -23 1 2 | while read l; do
    purge "/var/run/${l}"
done
