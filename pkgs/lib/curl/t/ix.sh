{% extends '//die/c/autorehell.sh' %}

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
{% block curl_http3 %}
lib/openssl
lib/ng/http/3
{% endblock %}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block bld_tool %}
bld/auto
{% endblock %}

{% block configure_flags %}
{% if linux %}
--with-random="/dev/urandom"
{% endif %}
{% if darwin %}
--disable-ldap
{% endif %}
{% endblock %}

{% block patch1 %}
sed -e 's|usigned.*|unsigned char buf\[1024\];|' \
    -i lib/curl_ntlm_wb.c
{% endblock %}
