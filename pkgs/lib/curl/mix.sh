{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_79_1.tar.gz
7a6ac0611e8fc77aa8b49d6b4bbdbbdc
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/c-ares/mix.sh
lib/idn/2/mix.sh
lib/zstd/mix.sh
lib/brotli/mix.sh
lib/nghttp2/mix.sh
lib/ssh/2/mix.sh
lib/{{curlssl or 'openssl'}}/mix.sh
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration/mix.sh
{% endif %}
{% endblock %}

{% block bld_tool %}
dev/doc/groff/mix.sh
dev/build/auto/conf/2/71/mix.sh
dev/build/auto/make/1.16.3/mix.sh
{% endblock %}

{% block configure_flags %}
--enable-manual
{% endblock %}
