{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz
f5752052fc5b8e1b539af86a3671eac7
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

{% block env %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
