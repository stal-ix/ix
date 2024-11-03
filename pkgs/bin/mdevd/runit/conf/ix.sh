{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir etc; cd etc

base64 -d << EOF > mdev.conf
{% include 'bad.conf/base64' %}
EOF

echo >> mdev.conf

mkdir -p runit/1.d; cd runit/1.d

cat << EOF > 01-01-mount-ro.sh
# mount dev
mount -t tmpfs tmpfs /dev
mkdir /dev/pts /dev/shm
mount -t devpts devpts /dev/pts
mount -t tmpfs shmfs /dev/shm
EOF

cat << EOF > 01-03-mount-ro.sh
# setup /dev
mdevd-coldplug
EOF
{% endblock %}
