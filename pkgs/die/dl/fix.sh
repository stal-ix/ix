{% extends 'map.sh' %}

{% set export_prefix %}
{% block export_prefix %}
{% endblock %}
{% endset %}

{% block export_symbols %}
{% endblock %}

{% block export_map %}
cat << EOF
{% for sym in self.export_symbols() | parse_list %}
{% if '=' in sym %}
{{self.export_lib().strip()}} {{sym.split('=')[0]}} {{export_prefix.strip()}}{{sym.split('=')[1]}}
{% else %}
{{self.export_lib().strip()}} {{sym}} {{export_prefix.strip()}}{{sym}}
{% endif %}
{% endfor %}
EOF
{% endblock %}
