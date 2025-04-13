{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.3.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/libtirpc/libtirpc-{{self.version().strip()}}.tar.bz2
sha:bbd26a8f0df5690a62a47f6aa30f797f3ef8d02560d1bc449a83066b5a1d3508
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
