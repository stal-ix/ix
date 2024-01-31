{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--without-ssl
{% endblock %}
