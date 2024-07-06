{% extends '//lib/icu/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-data-packaging=archive
{% endblock %}
