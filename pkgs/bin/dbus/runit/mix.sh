{% extends '//mix/proxy.sh' %}

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
exec srv dbus dbus-daemon --config-file=/etc/services/dbus/system.conf --nopidfile --syslog --nofork
EOF

chmod +x run
{% endblock %}
