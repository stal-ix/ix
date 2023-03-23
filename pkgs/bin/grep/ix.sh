{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/bsd/overlay
{% endblock %}
