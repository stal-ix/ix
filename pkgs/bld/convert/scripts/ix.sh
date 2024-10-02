{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/convert
{% include 'convert.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
