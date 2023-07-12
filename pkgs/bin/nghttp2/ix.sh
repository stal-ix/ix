{% extends '//lib/ng/http/2/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/ev
lib/xml/2
lib/boost
lib/c/ares
lib/ng/tcp2
lib/jansson
lib/openssl
lib/ng/http/3
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-app
--with-libngtcp2
--with-libnghttp3
--enable-hpack-tools
{% endblock %}
