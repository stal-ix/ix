{% extends '//die/make.sh' %}

{% block fetch %}
http://www.haproxy.org/download/2.6/src/haproxy-2.6.1.tar.gz
sha:915b351e6450d183342c4cdcda7771eac4f0f72bf90582adcd15a01c700d29b1
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
