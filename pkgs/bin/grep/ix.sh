{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
{% if linux %}
lib/bsd/overlay
{% endif %}
{% endblock %}
