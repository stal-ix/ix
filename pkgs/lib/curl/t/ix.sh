{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-8_1_2.tar.gz
sha:670d6aee0e32c687f7721a499e716d56fd1985eccb3186fe81a2f8097b4bc1fb
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
