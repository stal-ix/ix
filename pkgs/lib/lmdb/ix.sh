{% extends '//die/c/make.sh' %}

{% block pkg_name %}
LMDB
{% endblock %}

{% block version %}
1.0.3
{% endblock %}

{% block fetch %}
https://git.openldap.org/openldap/openldap/-/archive/LMDB_{{self.version().strip()}}/openldap-LMDB_{{self.version().strip()}}.tar.bz2
015f482ba647e926fbddc9cea49ed59281229c12896cd18675484c36712b98bd
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
