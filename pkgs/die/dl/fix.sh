{% extends 'map.sh' %}

{% set export_prefix %}
{% block export_prefix %}
{% endblock %}
{% endset %}

{% block export_map %}
cat << EOF
{% for sym in ix.parse_list(self.export_symbols()) %}
{{self.export_lib().strip()}} {{sym}} {{export_prefix.strip()}}{{sym}}
{% endfor %}
EOF
{% endblock %}
