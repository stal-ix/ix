{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.5.tar.bz2
sha:9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f
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
