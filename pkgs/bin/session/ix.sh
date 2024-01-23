{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/session
{% include 'session/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}
