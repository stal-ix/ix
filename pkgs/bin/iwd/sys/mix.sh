{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/iwd
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

# redefine defaults, allow all to control wifi
mkdir -p etc/dbus-1/system.d

base64 -d << EOF > etc/dbus-1/system.d/iwd-dbus.conf
{% include 'iwd-dbus.conf/base64' %}
EOF

mkdir -p etc/services/iwd; cd etc/services/iwd

cat << EOF > run
#!/bin/sh
exec srv iwd iwd
EOF

chmod +x run
{% endblock %}
