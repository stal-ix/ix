{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/3.0/src/haproxy-3.0.4.tar.gz
sha:aabfd98ada721bbfb68f7805586ced0373fb4c8d73e18faa94055a16c2096936
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
