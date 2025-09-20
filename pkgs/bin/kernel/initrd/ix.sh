{% extends '//die/gen.sh' %}

{% block fix_deps %}
["bin/kernel/initrd/gen"]
{% endblock %}

{% block install %}
mkdir ${out}/fix
base64 -d << EOF > ${out}/fix/gen_initrd.sh
{% include 'fix.sh/base64' %}
EOF
{% endblock %}
