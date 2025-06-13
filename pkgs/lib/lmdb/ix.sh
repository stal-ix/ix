{% extends '//die/c/make.sh' %}

{% block pkg_name %}
LMDB
{% endblock %}

{% block version %}
0.9.33
{% endblock %}

{% block fetch %}
https://git.openldap.org/openldap/openldap/-/archive/LMDB_{{self.version().strip()}}/openldap-LMDB_{{self.version().strip()}}.tar.bz2
d19d52725800177b89d235161c0af8ae8b2932207e3c9eb87e95b61f1925206d
{% endblock %}

{% block unpack %}
{{super()}}
cd libraries/liblmdb
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=${CC}
{% endblock %}
