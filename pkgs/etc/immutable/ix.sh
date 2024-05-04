{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/env.d ${out}/etc/runit/1.d

cat << EOF > ${out}/etc/runit/1.d/00-01-immutable.sh
# prepare tmpfs root
mount -t tmpfs tmpfs /sys
cd /sys
mkdir -p var/mnt/root
ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
mkdir ix
mkdir home
ln -s / usr
pivot_root /sys /sys/var/mnt/root
cd /
/var/mnt/root/bin/mount /var/mnt/root/ix /ix
mount /var/mnt/root/home /home
mount -o remount,rw /ix
mount -o remount,rw /home
mkdir -p dev sys proc var/run var/tmp var/log
chmod 01777 var/tmp
EOF

cat << EOF > ${out}/etc/runit/1.d/10-mount-rw.sh
# mount rw
mount -o remount,rw none /var/mnt/root
EOF

cat << EOF > ${out}/etc/env.d/ix_root.sh
export IX_ROOT=/ix
EOF
{% endblock %}
