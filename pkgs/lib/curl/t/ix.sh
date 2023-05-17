{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-8_1_0.tar.gz
sha:531565b17d1c427b05eeffb139e24d7a48f56e9d068cc75d107160c0848b433d
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
{% endblock %}
