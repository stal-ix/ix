{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/emptty{{slot}}; cd etc/services/emptty{{slot}}

cat << EOF > emptty.conf
LANG=C
NO_XDG_FALLBACK=true
DEFAULT_SESSION=wayland
DEFAULT_SESSION_ENV=wayland
LOGGING_FILE=/var/run/emptty{{slot}}/log
TTY_NUMBER={{slot}}
EOF

cat << EOF > daemon
fixtty /dev/tty{{slot}}
exec setsid openvt -c {{slot}} -e emptty --config ${PWD}/emptty.conf
EOF

cat << EOF > run
#!/bin/sh
exec srv emptty{{slot}} /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
