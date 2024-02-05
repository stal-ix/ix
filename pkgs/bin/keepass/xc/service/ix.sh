{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/bin

cat << EOF > ${out}/bin/keepassxc-service
#!/usr/bin/env sh
export WAYLAND_DISPLAY=wayland-1
exec keepassxc
EOF

chmod +x ${out}/bin/keepassxc-service

mkdir -p ${out}/share/dbus-1/services

cat << EOF > ${out}/share/dbus-1/services/org.freedesktop.secrets.service
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=${out}/bin/keepassxc-service
EOF
{% endblock %}
