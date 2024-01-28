{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/mingetty{{slot}}; cd etc/services/mingetty{{slot}}

cat << EOF > daemon
#!/bin/setsid /bin/sh
fixtty /dev/tty{{slot}}
exec mingetty tty{{slot}}
EOF

cat << EOF > run
#!/bin/sh
exec srv mingetty{{slot}} ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
