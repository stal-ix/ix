lst() (
    ps -o ppid,pid,args | awk '$1 == 1' | grep -v runsvdir
)

lstp() (
    lst | awk '{print $2}'
)

lst

lstp | while read l; do
    kill -9 ${l}
done
