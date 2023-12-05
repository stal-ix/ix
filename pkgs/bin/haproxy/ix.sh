{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.8/src/haproxy-2.8.4.tar.gz
sha:81bacbf50ec6d0f7ecaaad7c03e59978b00322fbdad6ed4a989dd31754b6f25d
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
