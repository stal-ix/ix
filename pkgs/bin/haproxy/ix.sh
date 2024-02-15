{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.9/src/haproxy-2.9.5.tar.gz
sha:32b785b128838f4218b8d54690c86c48794d03f817cbb627fb48769f79efd59b
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
