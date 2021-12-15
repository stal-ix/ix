{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz
f5752052fc5b8e1b539af86a3671eac7
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_libs %}
lib/readline/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-DSQLITE_OMIT_LOAD_EXTENSION=1 ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
