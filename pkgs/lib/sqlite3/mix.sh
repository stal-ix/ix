{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://www.sqlite.org/2021/sqlite-autoconf-3350500.tar.gz
d1d1aba394c8e0443077dc9f1a681bb8
{% endblock %}

{% block bld_deps %}
lib/readline/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-DSQLITE_OMIT_LOAD_EXTENSION=1 ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
