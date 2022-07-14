{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2022/sqlite-autoconf-3390100.tar.gz
sha:87c8e7a7fa0c68ab28e208ba49f3a22a56000dbf53a6f90206e2bc5843931cc4
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

{% block env_lib %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
