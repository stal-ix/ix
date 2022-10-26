{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_86_0.tar.gz
sha:8085bfc250ffa6f3b5b1b05bea42b368a0361ede004f7c2b9edf102a59e8efb4
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/zstd
lib/ssh/2
lib/idn/2
lib/brotli
lib/c-ares
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
