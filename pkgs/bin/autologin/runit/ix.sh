{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/autologin{{slot}}; cd etc/services/autologin{{slot}}

cat << EOF > daemon
export USER=root
export HOME=/home/root
fixtty /dev/tty{{slot}}
exec subreaper setsid openvt -f -c {{slot}} -e /bin/sh -l
EOF

cat << EOF > run
#!/bin/sh
exec srv autologin{{slot}} /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
