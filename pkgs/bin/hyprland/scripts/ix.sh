{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > hypr-session
#!/usr/bin/env sh
exec dbus-exec-session Hyprland
EOF

chmod +x *
{% endblock %}
