{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}; mkdir etc; cd etc

cat << EOF > passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
nobody:x:99:99:nobody:/dev/null:/bin/false
mix:x:1000:1000:bin:/dev/null:/bin/false
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

cat << EOF > init
#!/bin/yash

echo 'init complete'

exec /bin/yash
EOF

chmod +x init

ln -sv /proc/self/mounts mtab
{% endblock %}
