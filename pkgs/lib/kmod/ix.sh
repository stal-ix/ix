{% extends 't/ix.sh' %}

{% block configure_flags %}
--disable-tools
{{super()}}
{% endblock %}
