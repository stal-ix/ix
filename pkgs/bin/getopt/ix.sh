{% extends '//die/c/make.sh' %}

{% block fetch %}
http://frodo.looijaard.name/system/files/software/getopt/getopt-1.1.6.tar.gz
sha:d0bf1dc642a993e7388a1cddfb9409bed375c21d5278056ccca3a0acd09dc5fe
{% endblock %}

{% block make_flags %}
LIBCGETOPT=1
NOT_UTIL_LINUX=1
WITHOUT_GETTEXT=1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
