{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/nghttp2/nghttp2/archive/refs/tags/v1.46.0.tar.gz
77c54df8072bb387b39cffb194e2c818
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/ev/mix.sh
lib/c-ares/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_deps %}
lib/c++/mix.sh
lib/xml2/mix.sh
lib/jansson/mix.sh
dev/build/autoconf/2.71/mix.sh
dev/build/automake/1.16.3/mix.sh
{{super()}}
{% endblock %}

{% block autoreconf %}
autoreconf -i
{% endblock %}

{% block coflags %}
--enable-python-bindings=no
--disable-python-bindings
{% endblock %}
