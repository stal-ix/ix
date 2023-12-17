{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.9/src/haproxy-2.9.1.tar.gz
sha:d5801c772aab9c43f40964b7b33b4388d14b5b45750be4d2671785863cdb9f1c
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
