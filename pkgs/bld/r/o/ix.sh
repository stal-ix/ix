{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/chro
{% include 'chro/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
