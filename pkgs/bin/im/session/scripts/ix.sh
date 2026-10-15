{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > impulse-session
#!/usr/bin/env sh
exec dbus-exec-session imway "\${@}"
EOF

chmod +x *
{% endblock %}
