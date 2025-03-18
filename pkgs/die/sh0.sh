{% extends 'script.json' %}

{% block bld_deps %}
{{super()}}
{% if show_script %}
bin/sh/fmt
{% endif %}
{% if jail %}
bld/jail(tmpfs={{tmpfs}})
{% endif %}
{% endblock %}

{% block script_body %}
{% if show_script %}
base64 -d << EOF | shfmt -i 4 | cat -n
{{self.script_body_sh() | b64e}}
EOF
exit 1
{% else %}
{{self.script_body_sh().strip()}}
{% endif %}
{% endblock %}

{% block script_body_sh %}
# {{rebuild}}
{% endblock %}

{% block script_exec %}
{% if jail %}
["jail", "/sys", "{{ix_dir}}", "sh", "-s"]
{% else %}
["sh", "-s"]
{% endif %}
{% endblock %}
