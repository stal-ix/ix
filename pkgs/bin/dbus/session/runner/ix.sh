{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > {{prog}}-session
#!/usr/bin/env sh
# poor man's dbus env activation
export WAYLAND_DISPLAY=wayland-1
exec dbus-exec-session /bin/env -u WAYLAND_DISPLAY {{prog}} "\${@}"
EOF

chmod +x *
{% endblock %}
