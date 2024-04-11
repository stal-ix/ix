{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

base64 << EOF > ${out}/bin/shh
{% include 'shh/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}
