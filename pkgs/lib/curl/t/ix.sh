{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-8_9_1.tar.gz
sha:d714818f6ac41ae9154850158fed44b7a87650a6d52f83d3bcb9aa527be354d7
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
lib/{{curlssl or 'openssl'}}
{% block curl_http3 %}
lib/ng/tcp2
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
