{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2022/sqlite-autoconf-3390300.tar.gz
sha:7868fb3082be3f2cf4491c6fba6de2bddcbc293a35fefb0624ee3c13f01422b9
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
