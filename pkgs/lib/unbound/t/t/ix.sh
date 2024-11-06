{% extends '//lib/unbound/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-flto
--with-libunbound-only
{% endblock %}
