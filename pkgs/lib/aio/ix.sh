{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libaio
{% endblock %}

{% block version %}
0.3.113
{% endblock %}

{% block fetch %}
https://releases.pagure.org/libaio/libaio-{{self.version().strip()}}.tar.gz
sha:2c44d1c5fd0d43752287c9ae1eb9c023f04ef848ea8d4aafa46e9aedb678200b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block make_flags %}
RPMBUILD=
ENABLE_SHARED=0
{% endblock %}
