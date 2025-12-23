{% extends 'make.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
{{make_cmd_args | fix_list}} defconfig
cat - .config << EOF > _
{% block kconfig_flags %}
{% endblock %}
EOF
mv _ .config
{{make_cmd_args | fix_list}} oldconfig
{% endblock %}

{% block make_flags %}
CC=${CC}
HOSTCC=${HOST_CC}
{% endblock %}
