{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.8/src/haproxy-2.8.3.tar.gz
sha:9ecc6ffe67a977d1ed279107bbdab790d73ae2a626bc38eee23fa1f6786a759e
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
