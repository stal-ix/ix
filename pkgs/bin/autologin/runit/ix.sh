{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/autologin{{slot}}; cd etc/services/autologin{{slot}}

cat << EOF > daemon
#!/bin/sh
export USER=root
export HOME=/home/root
fixtty /dev/tty{{slot}}
exec subreaper openvt -c {{slot}} -w /bin/sh -l
EOF

cat << EOF > run
#!/bin/sh
exec srv autologin{{slot}} ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
