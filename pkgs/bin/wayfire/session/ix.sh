{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > wayfire-session
#!/usr/bin/env sh
exec dbus-exec-session wayfire
EOF

chmod +x *
{% endblock %}
