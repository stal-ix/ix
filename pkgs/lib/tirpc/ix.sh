{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.4.tar.bz2
sha:1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860
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

{% block env %}
export CPPFLAGS="-I${out}/include/tirpc \${CPPFLAGS}"
{% endblock %}
