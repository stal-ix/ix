{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--without-tools
{% endblock %}
