{% extends '//lib/lame/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-frontend
{% endblock %}
