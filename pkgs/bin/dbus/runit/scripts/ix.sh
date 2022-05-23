{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/dbus; cd etc/services/dbus

base64 -d << EOF > system.conf
{% include 'system.conf/base64' %}
EOF

cat << EOF > run
#!/bin/sh
exec srv dbus chrt -f 10 dbus-daemon --config-file=${PWD}/system.conf --nopidfile --syslog --nofork
EOF

chmod +x run
{% endblock %}
