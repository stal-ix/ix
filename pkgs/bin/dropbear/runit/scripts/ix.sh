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

exec /bin/dropbear -E -F -P pid \
    -r /etc/keys/dss_host_key   \
    -r /etc/keys/rsa_host_key   \
    -r /etc/keys/ecdsa_host_key \
    -r /etc/keys/ed25519_host_key
EOF

chmod +x run script
{% endblock %}
