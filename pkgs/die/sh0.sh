{% extends 'script.json' %}

{% block bld_deps %}
{{super()}}
{% if show_script %}
bin/sh/fmt
{% endif %}
{% if jail %}
bld/jail
{% endif %}
{% if tmpfs %}
bld/tmpfs
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

{% block script_confine %}
{% if isfile('/bin/confine') %}
/bin/confine
{% endif %}
{% block script_parts %}
{% if jail or tmpfs %}
unshare
-r
-U
-m
{% endif %}
{% if jail %}
jail
/sys
{{ix_dir}}
{% endif %}
{% if tmpfs %}
tmpfs
{{ix_dir}}
{% endif %}
sh
-s
{% endblock %}
{% endblock %}

{% block script_exec %}
{{ix.list_to_json(self.script_confine())}}
{% endblock %}
