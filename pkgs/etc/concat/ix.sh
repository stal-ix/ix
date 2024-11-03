{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/fix
base64 -d << EOF > ${out}/fix/01-concat.sh
{% include 'concat.sh/base64' %}
EOF
{% endblock %}
