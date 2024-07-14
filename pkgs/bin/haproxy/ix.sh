{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/3.0/src/haproxy-3.0.3.tar.gz
sha:39a73c187a0b00d2602cb3ffca52d1b59d90f09032734fe8c03eb2e29a7d19df
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/pcre/2
lib/openssl
lib/execinfo
{% endblock %}

{% block make_flags %}
TARGET=linux-musl
SBINDIR=${out}/bin
USE_CRYPT=yes
USE_PCRE2=yes
USE_OPENSSL=yes
USE_BACKTRACE=yes
{% endblock %}

{% block patch %}
sed -e 's|dlopen|dlopenxxx|g' -i src/tools.c
{% endblock %}
