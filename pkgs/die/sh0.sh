{% extends 'script.json' %}

{% block bld_deps %}
{{super()}}
{% if show_script %}
bin/sh/fmt
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
["sh", "-s"]
{% endblock %}
