{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/env.d ${out}/etc/runit/1.d

cat << EOF > ${out}/etc/runit/1.d/00-01-immutable.sh
# prepare tmpfs root
mount -t tmpfs tmpfs /sys
cd /sys
mkdir -p var/mnt/root ix home
ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
mount /ix ix
mount /home home
ln -s / usr
pivot_root /sys /sys/var/mnt/root
cd /
mkdir -p dev sys proc var/run var/log
EOF

cat << EOF > ${out}/etc/runit/1.d/10-mount-rw.sh
# mount rw
mount -o remount,rw /var/mnt/root
mount -o remount,rw /ix
mount -o remount,rw /home
EOF
{% endblock %}
