{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/runit
{% endblock %}

{% block install %}
cd ${out}

mkdir bin; cd bin

cat << EOF > srv
#!/bin/sh
cd /sys/fs/cgroup; mkdir -p \$\$; cd \$\$

echo \$\$ > cgroup.procs

cleanup() (
    echo 1 > cgroup.kill
)

trap cleanup TERM INT EXIT

\$@
EOF

chmod +x srv

cd ..

mkdir etc; cd etc

cat << EOF > init
#!/bin/sh
export PATH=/bin
export TMPDIR=/var/tmp
exec chpst -0 -1 -2 runit
EOF

chmod +x init

mkdir runit; cd runit

mkdir 1.d

cat << EOF > 1.d/00-mount-ro.sh
mount -t devtmpfs devtmpfs /dev

#mount -t tmpfs tmpfs /dev
mount -t sysfs sysfs /sys
mount -t proc proc /proc
mount -t cgroup2 none /sys/fs/cgroup

mkdir /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm
EOF

cat << EOF > 1.d/10-mount-rw.sh
mount -o remount,rw none /

mkdir -p /var/run /var/tmp /var/log

mount -t tmpfs tmpfs /var/run
mount -t tmpfs tmpfs /var/tmp
EOF

cat << EOF > 1.d/100-fini.sh
ifconfig lo 127.0.0.1
echo 0 > /proc/sys/kernel/printk
dmesg >> /var/log/boot
EOF

cat << EOF > 1
#!/bin/sh
cd /etc/runit/1.d

ls | sort | while read l; do
    sh \${l}
done
EOF

cat << EOF > 2
#!/bin/sh
mkdir -p /var/run/runsvdir
cd /var/run/runsvdir
exec cttyhack runsvdir -P /etc/services 1>>out 2>>out
EOF

cat << EOF > 3
#!/bin/sh
exec halt
EOF

chmod +x 1 2 3
{% endblock %}
