{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/dbus
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

rm -rf /var/run/dbus
mkdir -p /var/run/dbus
chown nobody /var/run/dbus

exec chpst -u nobody dbus-daemon --config-file=/etc/services/dbus/system.conf --nopidfile --syslog --nofork
EOF

chmod +x run
{% endblock %}
