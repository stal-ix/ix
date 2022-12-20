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

/bin/dropbearkey -t rsa -f dropbear_rsa_host_key || true
/bin/dropbearkey -t dss -f dropbear_dss_host_key || true
/bin/dropbearkey -t ecdsa -f dropbear_ecdsa_host_key || true
/bin/dropbearkey -t ed25519 -f dropbear_ed25519_host_key || true

exec /bin/dropbear -E -F -P pid \
    -r dropbear_dss_host_key    \
    -r dropbear_rsa_host_key    \
    -r dropbear_ecdsa_host_key  \
    -r dropbear_ed25519_host_key
EOF

chmod +x run script
{% endblock %}
