{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/zstd
lib/ssh/2
lib/idn/2
lib/brotli
lib/c/ares
lib/ng/http/2
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block configure_flags %}
{{super()}}
{% if linux %}
{% if libcurl_no_fallback %}
{% else %}
--with-ca-fallback
{% endif %}
--with-ca-bundle=/etc/ssl/cert.pem
{% endif %}
{% endblock %}
