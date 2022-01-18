{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_80_0.tar.gz
d96c3324dd060474508312449105d835
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/zstd
lib/ssh/2
lib/idn/2
lib/brotli
lib/c-ares
lib/nghttp2
lib/{{curlssl or 'openssl'}}
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/groff
dev/build/auto/conf/2/71
dev/build/auto/make/1/16
{% endblock %}

{% block configure_flags %}
--enable-manual
{% endblock %}
