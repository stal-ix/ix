{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/autologin{{slot}}; cd etc/services/autologin{{slot}}

cat << EOF > daemon
#!/bin/sh
export USER=root
export HOME=/home/root
export PATH=/ix/realm/root/bin:/bin
fixtty /dev/tty{{slot}}
exec subreaper openvt -c {{slot}} -w /bin/sh
EOF

cat << EOF > run
#!/bin/sh
exec srv autologin{{slot}} ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
