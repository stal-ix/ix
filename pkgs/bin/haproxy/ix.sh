{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.6/src/haproxy-2.6.3.tar.gz
sha:d18f7224a87b5cd6bbabb04d238f79a79fa461f0f8e1f257575cef8da2a307d9
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/pcre/2
{% endblock %}

{% block make_flags %}
TARGET=linux-musl
SBINDIR=${out}/bin
{% endblock %}
