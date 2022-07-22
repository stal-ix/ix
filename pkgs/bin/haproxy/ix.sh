{% extends '//die/c/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.6/src/haproxy-2.6.2.tar.gz
sha:f9b7dc06e02eb13b5d94dc66e0864a714aee2af9dfab10fa353ff9f1f52c8202
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
