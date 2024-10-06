{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/services/dropbear
cd ${out}/etc/services/dropbear

cat << EOF > run
#!/bin/sh
exec srv dropbear ${PWD}/script
EOF

cat << EOF > script
#!/bin/sh

set -xue

export TMPDIR=\${PWD}/tmp

rm -rf \${TMPDIR}
mkdir -p \${TMPDIR}
chmod 01777 \${TMPDIR}

exec /bin/dropbear \
    -e -E -F -P pid    \
    {{dropbear_flags}} \
    -r /etc/keys/dss   \
    -r /etc/keys/rsa   \
    -r /etc/keys/ecdsa \
    -r /etc/keys/ed25519
EOF

chmod +x run script
{% endblock %}
