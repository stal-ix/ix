{% extends '//lib/ldns/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-drill
--disable-ldns-config
{% endblock %}
