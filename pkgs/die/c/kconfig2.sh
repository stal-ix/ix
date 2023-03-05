{% extends 'make.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
{{ix.fix_list(make_cmd_args)}} defconfig
cat - .config << EOF > _
{% block kconfig_flags %}
{% endblock %}
EOF
mv _ .config
{{ix.fix_list(make_cmd_args)}} oldconfig
{% endblock %}

{% block make_flags %}
HOSTCC=${HOST_CC}
{% endblock %}
