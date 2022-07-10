{% extends '//die/make.sh' %}

{% block fetch %}
https://releases.pagure.org/libaio/libaio-0.3.113.tar.gz
sha:2c44d1c5fd0d43752287c9ae1eb9c023f04ef848ea8d4aafa46e9aedb678200b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block make_flags %}
RPMBUILD=
ENABLE_SHARED=0
{% endblock %}
