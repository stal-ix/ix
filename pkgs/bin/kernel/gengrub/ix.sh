{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/fix
base64 -d << EOF | sed -e 's|__flags__|{{kernel_boot_flags}}|' > ${out}/fix/gen_grub_menu.sh
{% include 'fix.sh/base64' %}
EOF
{% endblock %}
