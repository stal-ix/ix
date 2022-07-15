{% extends '//die/make.sh' %}

{% block fetch %}
https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.3.tgz
sha:d2a2a1d71df3d77396b1c16ad7502e674df446e06072b0e5a4e941c3d06c0d46
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
CC=clang
{% endblock %}
