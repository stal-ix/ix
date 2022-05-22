{% extends 'map.sh' %}

{% block export_map %}
cat << EOF
{% for sym in ix.parse_list(self.export_symbols()) %}
{{self.export_lib().strip()}} {{sym}} {{sym}}
{% endfor %}
EOF
{% endblock %}
