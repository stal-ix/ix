{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/runit/1.d

cat << EOF > ${out}/etc/runit/1.d/01-01-mount-ro.sh
# mount dev
mount -t devtmpfs devtmpfs /dev
mkdir -p /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm
# apply some quirks from mdev.conf
chmod 0666 /dev/dri/*
EOF
{% endblock %}
