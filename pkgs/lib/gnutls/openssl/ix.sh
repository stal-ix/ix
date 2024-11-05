{% extends '//lib/gnutls/pure/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-openssl-compatibility
{% endblock %}
