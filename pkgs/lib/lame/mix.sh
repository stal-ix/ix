{% extends '//lib/lame/t/mix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-frontend
{% endblock %}
