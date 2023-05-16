{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://sqlite.org/2023/sqlite-autoconf-3420000.tar.gz
sha:7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-dynamic-extensions=no
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
SQLITE_ENABLE_COLUMN_METADATA=1
{% endblock %}
