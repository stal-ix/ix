{% extends 't/ix.sh' %}

{% block configure_flags %}
--without-readline
{{super()}}
{% endblock %}
