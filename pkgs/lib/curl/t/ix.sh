{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
#https://github.com/curl/curl/archive/refs/tags/curl-7_88_1.tar.gz
#sha:eb9f2ca79e2c39b89827cf2cf21f39181f6a537f50dc1df9c33d705913009ac4
https://github.com/curl/curl/archive/refs/tags/curl-8_0_0.tar.gz
sha:572db1163c8aa40922ea108939a69afff3fcf6b341db0fcfc12796d2c3a27434
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
