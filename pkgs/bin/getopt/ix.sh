{% extends '//die/make.sh' %}

{% block fetch %}
http://frodo.looijaard.name/system/files/software/getopt/getopt-1.1.6.tar.gz
md5:4eaff9e6d8b2504a2e0d29ff0e9fd956
{% endblock %}

{% block make_flags %}
LIBCGETOPT=0
NOT_UTIL_LINUX=1
WITHOUT_GETTEXT=1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
