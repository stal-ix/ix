{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/gen_embed
{% include 'gen_embed.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
