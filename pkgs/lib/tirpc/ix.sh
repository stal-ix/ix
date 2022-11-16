{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.3.tar.bz2
sha:6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
--disable-gssapi
{% endblock %}
