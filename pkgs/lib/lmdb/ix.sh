{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.openldap.org/openldap/openldap/-/archive/LMDB_0.9.32/openldap-LMDB_0.9.32.tar.bz2
sha:039be48414f71299d04fb01da3e1a6461075bb77eaeeeda36ee5285de804ebf6
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
