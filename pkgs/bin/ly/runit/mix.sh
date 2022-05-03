{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bin/ly/sys
bin/runsrv
bin/fixtty
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/services/ly; cd etc/services/ly

cat << EOF > daemon
#!/bin/sh
fixtty /dev/tty1
reset
export LANG=C
exec openvt -w -c 1 ly
EOF

cat << EOF > run
#!/bin/sh
exec srv ly ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
