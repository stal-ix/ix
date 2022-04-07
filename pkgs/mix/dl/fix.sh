{% extends 'map.sh' %}

{% block export_map %}
{% for sym in mix.parse_list(self.export_symbols()) %}
{{self.export_lib().strip()}} {{sym}} {{sym}}
{% endfor %}
{% endblock %}
