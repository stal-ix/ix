{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/3.0/src/haproxy-3.0.5.tar.gz
sha:ae38221e85aeba038a725efbef5bfe5e76671ba7959e5eb74c39fd079e5d002e
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
