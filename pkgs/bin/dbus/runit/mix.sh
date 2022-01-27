{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/dbus/sys
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mkdir -p etc/services/dbus; cd etc/services/dbus

base64 -d << EOF > system.conf
{% include 'system.conf/base64' %}
EOF

cat << EOF > run
#!/bin/sh
mkdir -p /var/run/dbus
cd /var/run/dbus
exec flock lock dbus-daemon --config-file=/etc/services/dbus/system.conf --nopidfile --syslog --nofork 1>>out 2>>out
EOF

chmod +x run
{% endblock %}
