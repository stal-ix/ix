{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/mingetty{{slot}}; cd etc/services/mingetty{{slot}}

cat << EOF > daemon
fixtty /dev/tty{{slot}}
exec mingetty tty{{slot}}
EOF

cat << EOF > run
#!/bin/sh
exec srv{{srv_version}} mingetty{{slot}} /bin/setsid /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
