{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.7/src/haproxy-2.7.8.tar.gz
sha:15f2276971bbba8c47d86cc82ebfc6ec33e3aef2e4565058b2e4950c07b8e75c
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
