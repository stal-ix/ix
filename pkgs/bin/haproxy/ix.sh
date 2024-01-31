{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.9/src/haproxy-2.9.4.tar.gz
sha:9c3892cc3c084ac4f00125ef22a151cf181416d84aa8a37af6af6aa0399096bc
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
