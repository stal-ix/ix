{% extends '//die/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.2.tar.bz2
sha:e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd
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
