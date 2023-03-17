{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.7/src/haproxy-2.7.5.tar.gz
sha:e2c6e43270c35a4009a70052d26c1ddb90b63a650f81305a748f229737a74502
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/pcre/2
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

{% block patch %}
sed -e 's|dlopen|dlopenxxx|g' -i src/tools.c
{% endblock %}
