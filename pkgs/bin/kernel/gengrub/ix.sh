{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/fix
base64 -d << EOF > ${out}/fix/gen_grub_menu.sh
{% include 'fix.sh/base64' %}
EOF
{% endblock %}
