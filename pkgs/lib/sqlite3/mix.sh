{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://www.sqlite.org/2021/sqlite-autoconf-3350500.tar.gz
# md5 d1d1aba394c8e0443077dc9f1a681bb8
{% endblock %}

{% block bld_deps %}
lib/readline/mix.sh
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-DSQLITE_OMIT_LOAD_EXTENSION=1 ${CPPFLAGS}"
{% endblock %}

{% block env %}
export SQLITE3_ROOT="${out}"
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
