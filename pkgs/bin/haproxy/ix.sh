{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.7/src/haproxy-2.7.3.tar.gz
sha:b17e51b96531843b4a99d2c3b6218281bc988bf624c9ff90e19f0cbcba25d067
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
