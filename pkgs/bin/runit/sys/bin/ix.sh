{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > halt
#!/bin/sh
sync
sync
exec runit-init 0
EOF

chmod +x halt

cat << EOF > reboot
#!/bin/sh
sync
sync
exec runit-init 6
EOF

chmod +x reboot

cat << EOF > init
#!/bin/sh
export PATH=/bin
exec chpst -0 -1 -2 runit
EOF

chmod +x init
{% endblock %}
