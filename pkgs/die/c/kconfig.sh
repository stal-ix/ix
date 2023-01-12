{% extends 'make.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
cat << EOF > .config
{% block kconfig_flags %}
{% endblock %}
EOF

{% set make_cmd %}
{{make_cmd_args}}

{% block kconfig_target %}
defconfig
{% endblock %}
{% endset %}

{{ix.fix_list(make_cmd)}}
{% endblock %}

{% block make_flags %}
HOSTCC=${HOST_CC}
{% endblock %}
