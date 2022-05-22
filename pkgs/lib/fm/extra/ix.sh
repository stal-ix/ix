{% extends '//lib/fm/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-extra-only
{% endblock %}
