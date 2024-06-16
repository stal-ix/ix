{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/3.0/src/haproxy-3.0.2.tar.gz
sha:9672ee43b109f19356c35d72687b222dcf82b879360c6e82677397376cf5dc36
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
