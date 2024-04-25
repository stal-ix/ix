{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > halt
#!/bin/sh
sync
sync
exec runit-init 0
EOF

chmod +x halt

cat << EOF > reboot
#!/bin/sh
sync
sync
exec runit-init 6
EOF

chmod +x reboot

cat << EOF > init
#!/bin/sh
export PATH=/bin
exec chpst -0 -1 -2 runit
EOF

chmod +x init

cd ..

mkdir fix; base64 -d << EOF > fix/run1.sh
{% include 'run1.sh/base64' %}
EOF

mkdir -p etc/env.d

cat << EOF > etc/env.d/00-env.sh
export TMPDIR=/var/tmp
EOF

mkdir -p etc/sysctl.d

cat << EOF > etc/sysctl.d/ping.conf
net.ipv4.ping_group_range = 0 4294967294
EOF

cat << EOF > etc/sysctl.d/swap.conf
vm.swappiness = 10
EOF

{# https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes #}
cat << EOF > etc/sysctl.d/quic.conf
net.core.rmem_max = 2500000
net.core.wmem_max = 2500000
EOF

mkdir -p etc/runit; cd etc/runit

cat << EOF > 2
#!/bin/sh
unset TERM
mkdir -p /var/run/runsvdir
cd /var/run/runsvdir
exec 1>out
exec 2>&1
set -x
cat /var/log/boot
rm -rf /var/log
exec runsvdir -P /etc/services
EOF

cat << EOF > 3
#!/bin/sh
mount -o remount,ro /
EOF

chmod +x 2 3

mkdir 1.d; cd 1.d

cat << EOF > 00-env.sh
export PATH=/bin
EOF

cat << EOF > 01-00-mount-ro.sh
# mount ro
mount -t sysfs sysfs /sys
mount -t debugfs none /sys/kernel/debug
mount -t proc proc /proc
mount -t cgroup2 none /sys/fs/cgroup
EOF

cat << EOF > 01-01-mount-ro.sh
# mount dev
mount -t devtmpfs devtmpfs /dev
mkdir /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm
EOF

cat << EOF > 01-02-mount-ro.sh
# populate some nodes
ln -s /proc/self/fd/0 /dev/stdin
ln -s /proc/self/fd/1 /dev/stdout
ln -s /proc/self/fd/2 /dev/stderr
EOF

cat << EOF > 10-mount-rw.sh
# mount rw
mount -o remount,rw none /
rm -rf /var
mkdir /var
mount -t tmpfs tmpfs /var
mkdir -p /var/run /var/tmp /var/log /var/mnt
chmod 01777 /var/tmp
EOF

cat << EOF > 11-log.sh
exec 1>/var/log/boot
exec 2>&1
set -x
EOF

cat << EOF > 98-sysctl.sh
# apply sysctls
sysctl -p /etc/sysctl
EOF

cat << EOF > 99-fini.sh
# fini
echo always > /sys/kernel/mm/transparent_hugepage/enabled
echo 1 > /sys/kernel/mm/transparent_hugepage/khugepaged/scan_sleep_millisecs
echo 1000 > /sys/kernel/mm/lru_gen/min_ttl_ms
ifconfig lo 127.0.0.1
hostname -F /etc/hostname
echo 0 > /proc/sys/kernel/printk
dmesg
EOF
{% endblock %}
