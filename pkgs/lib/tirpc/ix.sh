{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.3.tar.bz2
sha:
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
lib/bsd/overlay
{% endblock %}

{% block configure_flags %}
--disable-gssapi
{% endblock %}
