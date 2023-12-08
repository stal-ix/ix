{% extends '//lib/curl/lite/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/gnutls
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-openssl
--without-openssl
--with-openssl=no
{% endblock %}
