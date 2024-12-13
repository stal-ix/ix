{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/3.1/src/haproxy-3.1.1.tar.gz
sha:8c1b5d439ba4b278e602445c57e20067adef214dc9c44c2a1cf172fad5f7d273
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
USE_CRYPT=1
USE_PCRE2=1
USE_OPENSSL=1
USE_BACKTRACE=1
{#
[275172.615921] haproxy[15445]: segfault at 30 ip 000000000091d354 sp 00007f70fd5b7760 error 4 in haproxy[71c354,455000+4df000] likely on CPU 73 (core 9, socket 1)
#}
USE_CPU_AFFINITY=0
{% endblock %}

{% block patch %}
sed -e 's|dlopen|dlopenxxx|g' -i src/tools.c
{% endblock %}
