{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/runit
{% endblock %}

{% block install %}
cd ${out}; mkdir etc; cd etc

cat << EOF > init
#!/bin/sh
export PATH=/bin
export TMPDIR=/var/tmp
exec chpst -0 -1 -2 runit
EOF

chmod +x init

mkdir runit; cd runit

cat << EOF > 1
#!/bin/sh

mount -t tmpfs tmpfs /dev
mount -t sysfs sysfs /sys
mount -t proc proc /proc

mdev -s

mkdir /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm

mount -o remount,rw none /

mkdir -p /var/run /var/tmp /var/log

mount -t tmpfs tmpfs /var/run
mount -t tmpfs tmpfs /var/tmp

ifconfig lo 127.0.0.1

echo 0 > /proc/sys/kernel/printk

dmesg >> /var/log/boot
EOF

cat << EOF > 2
#!/bin/sh
mkdir -p /var/run/runsvdir
cd /var/run/runsvdir
exec cttyhack runsvdir -P /etc/services 1>stdout 2>stderr
EOF

cat << EOF > 3
#!/bin/sh
exec halt
EOF

chmod +x 1 2 3
{% endblock %}
