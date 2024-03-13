{% extends '//die/proxy.sh' %}

{% block bld_data %}
aux/entropy(entropy_seed={{seed | b64e}}ksjfhbgasfdg76,entropy_size=1000000)
{% endblock %}

{% block bld_tool %}
bin/dropbear/stock
bin/dropbear/runit/keygen
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/keys
for x in rsa dss ecdsa ed25519; do
    purekeygen -t ${x} -f ${out}/etc/keys/${x}
    dropbearconvert dropbear openssh ${out}/etc/keys/${x} ${out}/etc/keys/ssh_${x}
    dropbearkey -f ${out}/etc/keys/${x} -y | grep -v ':' | awk '{print $1" "$2}' > ${out}/etc/keys/ssh_${x}.pub
done
{% endblock %}
