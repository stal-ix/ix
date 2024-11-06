{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-8_10_1.tar.gz
sha:5aaf131294f734756325dd99d849518c9a5060fc702517ab3064c76257dc700c
{% endblock %}

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
