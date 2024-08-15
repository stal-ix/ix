{% extends '//lib/python/3/13/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-gil
{% endblock %}
