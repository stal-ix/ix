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

exec /bin/dropbear -E -F -P pid      \
    -r /bin/dropbear/dss_host_key    \
    -r /bin/dropbear/rsa_host_key    \
    -r /bin/dropbear/ecdsa_host_key  \
    -r /bin/dropbear/ed25519_host_key
EOF

chmod +x run script
{% endblock %}
