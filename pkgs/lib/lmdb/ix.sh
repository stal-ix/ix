{% extends '//die/c/make.sh' %}

{% block pkg_name %}
LMDB
{% endblock %}

{% block version %}
1.0.1
{% endblock %}

{% block fetch %}
https://git.openldap.org/openldap/openldap/-/archive/LMDB_{{self.version().strip()}}/openldap-LMDB_{{self.version().strip()}}.tar.bz2
1ae17f11ebdeb0d69e53416bb6e0a7479a7d3d5b5ca443a474bff5b5f886a348
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
