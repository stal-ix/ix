{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtirpc
{% endblock %}

{% block version %}
1.3.7
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-{{self.version().strip()}}.tar.bz2
b47d3ac19d3549e54a05d0019a6c400674da716123858cfdb6d3bdd70a66c702
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
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
