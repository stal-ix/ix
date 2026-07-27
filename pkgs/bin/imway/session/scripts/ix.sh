{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > imway-session
#!/usr/bin/env sh
# the session bus wraps the compositor; no env preseeding needed — imway
# pushes its real socket name into the bus activation environment itself
# (org.freedesktop.DBus.UpdateActivationEnvironment)
exec dbus-exec-session /home/pg/monorepo/imway/imway "\${@}"
EOF

chmod +x *
{% endblock %}
