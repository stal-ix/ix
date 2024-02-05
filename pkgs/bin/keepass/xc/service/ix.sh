{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/share/dbus-1/services

cat << EOF > ${out}/share/dbus-1/services/org.freedesktop.secrets.service
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=keepassxc
EOF
{% endblock %}
