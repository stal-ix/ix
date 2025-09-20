{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/fix
base64 -d << EOF | sed -e 's|__flags__|{{kernel_boot_flags}}|' > ${out}/fix/gen_grub_menu.sh
{% if initrd %}
{% include 'fix_rd.sh/base64' %}
{% else %}
{% include 'fix.sh/base64' %}
{% endif %}
EOF
{% endblock %}
