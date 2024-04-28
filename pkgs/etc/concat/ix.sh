{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/fix
base64 -d << EOF > ${out}/fix/00-concat.sh
{% include 'concat.sh/base64' %}
EOF
{% endblock %}
