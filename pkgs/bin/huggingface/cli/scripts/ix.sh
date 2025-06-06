{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin
base64 -d << EOF > ${out}/bin/huggingface-cli
{% include 'cli.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}
