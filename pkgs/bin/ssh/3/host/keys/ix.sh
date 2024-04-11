{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/ssh/3/gencert
aux/entropy(entropy_seed={{seed | b64e}}sdjkfjkfh27856,entropy_size=1000000)
{% endblock %}

{% block build %}
ssh3-gencert
{% endblock %}

{% block install %}
mkdir -p ${out}/etc/keys
cp cert ${out}/etc/keys/ssh3_cert.pem
cp key ${out}/etc/keys/ssh3_priv.key
{% endblock %}
