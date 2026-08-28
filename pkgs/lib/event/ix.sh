{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libevent
{% endblock %}

{% block version %}
2.1.13
{% endblock %}

{% block fetch %}
https://github.com/libevent/libevent/archive/refs/tags/release-{{self.version().strip()}}-stable.tar.gz
1a0885e17dc78afbaeddf13cf849f9238bbc24acdc178464a0d1934d7c5ffbd5
{% endblock %}

{% block lib_deps %}
lib/c
lib/bsd
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block env %}
export COFLAGS="--with-libevent=${out} \${COFLAGS}"
{% endblock %}

{% block configure_flags %}
--disable-libevent-regress
--disable-samples
{% endblock %}
