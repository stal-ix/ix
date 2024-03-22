{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/ly; cd etc/services/ly

cat << EOF > daemon
fixtty /dev/tty1
reset
export LANG=C
exec setsid openvt -e -c 1 ly
EOF

cat << EOF > run
#!/bin/sh
exec srv ly /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
