{% extends '//lib/unbound/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-libunbound-only
{% endblock %}
