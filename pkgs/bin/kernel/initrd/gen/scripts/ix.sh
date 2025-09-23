{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/copybin
{% include 'copybin.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
