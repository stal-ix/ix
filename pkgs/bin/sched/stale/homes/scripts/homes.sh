set -xue

ls /home | sort > 1
cat /etc/passwd | awk -F':' '{print $1}' | sort > 2

comm -23 1 2 | while read l; do
    purge "/home/${l}"
done
