{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir etc; cd etc

base64 -d << EOF > mdev.conf
{% include 'bad.conf/base64' %}
EOF

echo >> mdev.conf

mkdir -p runit/1.d; cd runit/1.d

cat << EOF > 01-mount-ro.sh
# mount ro
mount -t sysfs sysfs /sys
mount -t debugfs none /sys/kernel/debug
mount -t proc proc /proc
mount -t cgroup2 none /sys/fs/cgroup
# mount dev
mount -t tmpfs tmpfs /dev
mkdir /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm
# populate some nodes
ln -s /proc/self/fd/0 /dev/stdin
ln -s /proc/self/fd/1 /dev/stdout
ln -s /proc/self/fd/2 /dev/stderr
# setup /dev
mdev -s
EOF
{% endblock %}
