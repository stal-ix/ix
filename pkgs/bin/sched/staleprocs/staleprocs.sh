lst() (
    ps -o ppid,pid,args | awk '$1 == 1' | grep -v runsvdir | grep -v sway | grep -v foot
)

lstp() (
    lst | awk '{print $2}'
)

lst

for s in "SIGINT" "SIGTERM" "SIGKILL"; do
    lstp | while read l; do
        echo "${s} ${l}"
        kill -${s} ${l}
    done

    sleep 1
done
