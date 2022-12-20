{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/openssl
bin/dropbear/runit/keygen
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/keys
openssl enc -aes-256-ctr -pass pass:'{{seed}}' -nosalt < /dev/zero | head -n 1000000 > entropy
export ENTROPY=${PWD}/entropy
purekeygen -t rsa -f ${out}/etc/keys/rsa_host_key
purekeygen -t dss -f ${out}/etc/keys/dss_host_key
purekeygen -t ecdsa -f ${out}/etc/keys/ecdsa_host_key
purekeygen -t ed25519 -f ${out}/etc/keys/ed25519_host_key
{% endblock %}
