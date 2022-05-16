{% extends '//lib/fm/t/mix.sh' %}

{% block configure_flags %}
{{super()}}
--with-extra-only
{% endblock %}
