{% extends '//die/make.sh' %}

{% block fetch %}
https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.2.tgz
sha:81d09345232eb62486ecf5acacd2c56c0c45b4a6c8c066612e7f421a23a1cf87
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
