{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.7/src/haproxy-2.7.4.tar.gz
sha:84cb806030569e866812eed38ebd1a8ea6fe1d9800001e59924ec3dd39553b9f
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
