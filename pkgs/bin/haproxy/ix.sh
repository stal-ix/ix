{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.9/src/haproxy-2.9.0.tar.gz
sha:fba18acd1a46337fe20ae07c816c2496c8602b80a1bc9ff3768d4caa5fb80eab
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
