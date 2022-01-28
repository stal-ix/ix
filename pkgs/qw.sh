trap cleanup TERM INT EXIT

cleanup() {
    echo clean
}

exec echo 2

