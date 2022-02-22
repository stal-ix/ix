{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2022/sqlite-autoconf-3370200.tar.gz
sha:4089a8d9b467537b3f246f217b84cd76e00b1d1a971fe5aca1e30e230e46b2d8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/readline
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
