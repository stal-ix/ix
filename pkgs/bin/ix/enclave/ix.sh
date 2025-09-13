{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/enclave
{% include 'enclave.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
