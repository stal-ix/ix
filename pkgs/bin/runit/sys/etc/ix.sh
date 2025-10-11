{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}

mkdir fix

base64 -d << EOF > fix/00-run1.sh
{% include 'run1.sh/base64' %}
EOF

mkdir -p etc/profile.d

cat << EOF > etc/profile.d/00-env.sh
export PATH=/ix/realm/\${USER}/bin:/bin
EOF

mkdir -p etc/sysctl.d

cat << EOF > etc/sysctl.d/ping.conf
net.ipv4.ping_group_range = 0 4294967294
EOF

cat << EOF > etc/sysctl.d/swap.conf
vm.swappiness = 10
EOF

cat << EOF > etc/sysctl.d/maxpid.conf
kernel.pid_max = 4194304
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
export TMPDIR=/var/run/runsvdir
exec 1>out
exec 2>&1
set -x
cat /var/log/boot
rm -rf /var/log
exec pid1
EOF

chmod +x 2

mkdir 1.d; cd 1.d

cat << EOF > 00-00-env.sh
export PATH=/bin
EOF

cat << EOF > 01-00-mount-ro.sh
# mount ro
mount -t sysfs sysfs /sys
mount -t debugfs none /sys/kernel/debug
mount -t tracefs none /sys/kernel/tracing
mount -t proc proc /proc
mount -t cgroup2 none /sys/fs/cgroup
EOF

cat << EOF > 01-02-mount-ro.sh
# populate some nodes
ln -s /proc/self/fd/0 /dev/stdin
ln -s /proc/self/fd/1 /dev/stdout
ln -s /proc/self/fd/2 /dev/stderr
EOF

cat << EOF > 10-mount-rw.sh
# mount rw
mount -o remount,rw /
rm -rf /var
mkdir /var
mount -t tmpfs tmpfs /var
mkdir -p /var/run /var/log /var/mnt
EOF

cat << EOF > 11-fix-perm.sh
# fix permissions
chown ix:ix /ix
chown ix:ix /ix/*
mkdir -p /ix/realm /ix/trash
chmod 01777 /ix/realm
chmod 01777 /ix/trash
EOF

cat << EOF > 12-log.sh
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
dmesg -c
EOF
{% endblock %}
