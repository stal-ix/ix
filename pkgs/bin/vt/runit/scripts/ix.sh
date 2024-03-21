{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/vt{{slot}}; cd etc/services/vt{{slot}}

cat << EOF > daemon
fixtty /dev/tty{{slot}}
exec subreaper openvt -c {{slot}} -w /bin/login
EOF

cat << EOF > run
#!/bin/sh
exec srv2 vt{{slot}} /bin/setsid /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
