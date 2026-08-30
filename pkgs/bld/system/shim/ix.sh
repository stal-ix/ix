{% extends '//die/env.sh' %}

# tool_name is an absolute path, resolved by ix_boot_tool in the hub

# ${out}/bin lands in PATH via the base template, nothing else to export
{% block env %}
{% endblock %}

{% block script_body %}
{{super()}}
mkdir -p ${out}/bin
ln -s {{tool_name}} ${out}/bin/{{tool_name | basename}}
{% endblock %}
