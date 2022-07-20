{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir etc; cd etc

base64 -d << EOF > mdev.conf
{% include 'bad.conf/base64' %}
EOF

echo >> mdev.conf

mkdir -p runit/1.d; cd runit/1.d

cat << EOF > 00-mount-ro.sh
# mount ro
mount -t sysfs sysfs /sys
mount -t debugfs none /sys/kernel/debug
mount -t proc proc /proc
mount -t cgroup2 none /sys/fs/cgroup
mount -t tmpfs tmpfs /dev
mkdir /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm
mdev -s
EOF

cd ../..

mkdir -p services/mdevd; cd services/mdevd

cat << EOF > run
#!/bin/sh
exec srv mdevd mdevd -O 4 -f /etc/mdev.conf -C
EOF

chmod +x run
{% endblock %}
