{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.9/src/haproxy-2.9.2.tar.gz
sha:851aee830ec28c1791246a9fd4478f643d115a563dd907f6612cc381a952ab3c
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
