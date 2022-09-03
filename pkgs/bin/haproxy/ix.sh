{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.6/src/haproxy-2.6.5.tar.gz
sha:ce9e19ebfcdd43e51af8a6090f1df8d512d972ddf742fa648a643bbb19056605
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
