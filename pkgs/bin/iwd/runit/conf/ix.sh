{% extends '//die/proxy.sh' %}

{% block install %}
{{super()}}
# redefine defaults, allow all to control wifi
mkdir -p ${out}/etc/dbus-1/system.d
base64 -d << EOF > ${out}/etc/dbus-1/system.d/iwd-dbus.conf
{% include 'iwd-dbus.conf/base64' %}
EOF
{% endblock %}
