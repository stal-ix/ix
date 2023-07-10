{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.5.tgz
sha:2e27a8d4f4c2af8fe840b573271c20aa163e24987f9765214644290f5beb38d9
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
