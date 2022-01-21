{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}; mkdir etc; cd etc

cat << EOF > passwd
root:x:0:0:root:/home/root:/bin/sh
bin:x:1:1:bin:/dev/null:/bin/false
nobody:x:99:99:nobody:/dev/null:/bin/false
mix:x:1000:1000:bin:/home/mix:/bin/sh
EOF

cat << EOF > group
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuidd:x:80:
wheel:x:97:
nogroup:x:99:
users:x:999:
EOF

cat << EOF > hosts
127.0.0.1  localhost mix
::1        localhost
EOF

mkdir runit; cd runit

cat << EOF > 1
#!/bin/sh

mkdir /dev/pts
mount -t devpts devpts /dev/pts

mount -o remount,rw none /

mkdir -p /proc /sys /run

mount -t tmpfs tmpfs /run
mount -t proc proc /proc
mount -t sysfs sysfs /sys

dmesg >> /run/messages
EOF

cat << EOF > 2
#!/bin/sh
exec runsvdir -P /etc/services
EOF

cat << EOF > 3
#!/bin/sh
exec halt
EOF

chmod +x 1 2 3; cd ..

mkdir services; cd services

for i in 1 2 3 4 5; do (
    mkdir getty${i}; cd getty${i}

    cat << EOF > run
#!/bin/sh
exec setsid cttyhack agetty --autologin root tty${i}
EOF

    chmod +x run
) done

(
    mkdir syslogd; cd syslogd

    cat << EOF > run
#!/bin/sh
exec syslogd -n -O /run/messages
EOF

    chmod +x run
)

cd ..

cat << EOF > init
#!/bin/sh
export PATH=/bin
exec runit
EOF

chmod +x init

ln -sv /proc/self/mounts mtab
{% endblock %}
