{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-libsigsegv
{% endblock %}
