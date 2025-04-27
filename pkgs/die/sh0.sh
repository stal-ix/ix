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
{% if stalix %}
{% if isfile('/bin/confine') %}
/ix/realm/system/bin/confine
{{ix_dir}}
{% endif %}
{% if skipsrc %}
{% else %}
{% if isfile('/bin/tmpfs') %}
/ix/realm/system/bin/tmpfs
{{ix_dir}}
{% endif %}
{% endif %}
{% endif %}
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
{% block script_parts %}
sh
-s
{% endblock %}
{% endblock %}

{% block script_exec %}
{{ix.list_to_json(self.script_confine())}}
{% endblock %}
