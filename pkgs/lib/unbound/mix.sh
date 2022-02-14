{% extends '//lib/unbound/t/mix.sh' %}

{% block configure_flags %}
{{super()}}
--with-libunbound-only
{% endblock %}
