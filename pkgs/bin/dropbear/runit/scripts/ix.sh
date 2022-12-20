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

mkdir -p /var/run/dropbear
cd /var/run/dropbear

exec /bin/dropbear \
    -E -F -P pid   \
    -r /etc/keys/dss   \
    -r /etc/keys/rsa   \
    -r /etc/keys/ecdsa \
    -r /etc/keys/ed25519
EOF

chmod +x run script
{% endblock %}
