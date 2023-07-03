{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.8/src/haproxy-2.8.1.tar.gz
sha:485552fcd9d5d5f41aad046f131fc0a7e849bef25a349a040750af0c6fc56807
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
