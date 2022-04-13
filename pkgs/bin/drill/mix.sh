{% extends '//lib/ldns/mix.sh' %}

{% block configure_flags %}
{{super()}}
--with-drill
--disable-ldns-config
{% endblock %}
