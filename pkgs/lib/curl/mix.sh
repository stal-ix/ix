{% extends '//mix/autorehell.sh' %}

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
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block run_data %}
aux/ca-bundle
{% endblock %}

{% block bld_tool %}
bin/groff
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block configure_flags %}
--with-random="/dev/urandom"
--with-ca-bundle="${CA_BUNDLE}"
--enable-manual
{% endblock %}
