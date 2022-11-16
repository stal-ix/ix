{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.6/src/haproxy-2.6.5.tar.gz
sha:ce9e19ebfcdd43e51af8a6090f1df8d512d972ddf742fa648a643bbb19056605
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/pcre/2
lib/xcrypt
lib/openssl
lib/execinfo
lib/pcre/2/posix
{% endblock %}

{% block make_flags %}
TARGET=linux-musl
SBINDIR=${out}/bin
USE_CRYPT=yes
USE_PCRE2=yes
USE_OPENSSL=yes
USE_BACKTRACE=yes
{% endblock %}
