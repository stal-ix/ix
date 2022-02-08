(
    ps -o pid,comm | grep WebKit
    ps -o pid,comm | grep epip
    ps -o pid,comm | grep sway
) | awk '{print $1}' | while read l; do
    chrt -r -p 50 ${l}
done
