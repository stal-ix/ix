{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_79_1.tar.gz
7a6ac0611e8fc77aa8b49d6b4bbdbbdc
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c-ares
lib/idn/2
lib/zstd
lib/brotli
lib/nghttp2
lib/ssh/2
lib/{{curlssl or 'openssl'}}
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block bld_tool %}
dev/doc/groff
dev/build/auto/conf/2/71
dev/build/auto/make/1/16
{% endblock %}

{% block configure_flags %}
--enable-manual
{% endblock %}
