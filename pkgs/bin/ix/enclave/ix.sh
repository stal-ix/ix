{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/enclave
{% include 'enclave.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/enclave_slave
{% include 'enclave_slave.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
