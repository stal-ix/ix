{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin
cat << EOF > ${out}/bin/initrd
#!/bin/sh
set -ue
export PATH=/bin
mkdir -p /dev /sys /proc /tmp
mount -t devtmpfs devtmpfs /dev
mount -t proc proc /proc
mount -t sysfs sysfs /sys
btrfs device scan
mount /dev/nvme0n1p2 /tmp
cd /tmp
mount --move . /
exec chroot . /bin/init
EOF
chmod +x ${out}/bin/initrd
{% endblock %}
