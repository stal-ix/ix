{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/3.0/src/haproxy-3.0.1.tar.gz
sha:fef923c51ddc0ffb3c73b9b95e31e98c82cb9521c64754c5e95c42907406a670
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
