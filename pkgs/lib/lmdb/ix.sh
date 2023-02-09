{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.4.tgz
sha:d51704e50178430c06cf3d8aa174da66badf559747a47d920bb54b2d4aa40991
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
