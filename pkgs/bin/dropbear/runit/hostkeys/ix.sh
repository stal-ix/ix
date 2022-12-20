{% extends '//die/proxy.sh' %}

{% block bld_data %}
aux/entropy(entropy_seed={{seed|b64}},entropy_size=1000000)
{% endblock %}

{% block bld_tool %}
bin/dropbear/runit/keygen
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/keys
for x in rsa dss ecdsa ed25519; do
    purekeygen -t ${x} -f ${out}/etc/keys/${x}
done
{% endblock %}
