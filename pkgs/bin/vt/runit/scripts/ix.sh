{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/vt{{slot}}; cd etc/services/vt{{slot}}

cat << EOF > daemon
set -xue
export TERM=linux
export XDG_VTNR={{slot}}
export TMPDIR=\${PWD}/tmp
fixtty /dev/tty{{slot}}
rm -rf \${TMPDIR}
mkdir -p \${TMPDIR}
chmod 01777 \${TMPDIR}
exec subreaper setsid openvt -c {{slot}} -f -e -- /bin/sh -c 'reset; clear; exec login -p'
EOF

cat << EOF > run
#!/bin/sh
exec srv vt{{slot}} /bin/sh ${PWD}/daemon
EOF

chmod +x run daemon
{% endblock %}
