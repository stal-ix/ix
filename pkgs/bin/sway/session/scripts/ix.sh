{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > sway-session
#!/usr/bin/env sh
exec dbus-exec-session sway
EOF

chmod +x *
{% endblock %}
