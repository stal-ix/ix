{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}

mkdir bin
cd bin

cat << EOF > halt
#!/bin/sh
sync
sync
exec runit-init 0
EOF

cat << EOF > reboot
#!/bin/sh
sync
sync
exec runit-init 6
EOF

cat << EOF > init
#!/bin/sh
export PATH=/bin
exec chpst -0 -1 -2 runit
EOF

cat << EOF > pid1
#!/bin/sh
exec runsvdir -P /etc/services
EOF

chmod +x *
{% endblock %}
