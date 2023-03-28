{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.7/src/haproxy-2.7.6.tar.gz
sha:133f357ddb3fcfc5ad8149ef3d74cbb5db6bb4a5ab67289ce0b0ab686cdeb74f
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
