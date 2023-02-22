{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc
base64 -d << EOF > ${out}/etc/dbus.conf
{% include 'system.conf/base64' %}
EOF
{% endblock %}
